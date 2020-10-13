using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chalkboard.ViewModel;

namespace Chalkboard.Business
{
    public class Activity : BaseBusiness, IActivity
    {
        public Activity()
        {

        }
        public ActivityModel CreateOrUpdateActivity(ActivityModel activityModel)
        {
            var activity = _mapper.Map<DatabaseModels.Activity>(activityModel);
            var group = _chalkboardEntities.Groups.FirstOrDefault(_f => _f.Id == activityModel.GroupId);
            string fileNames = "";
            if (activity.Id == 0)
            {
                _chalkboardEntities.Activities.Add(activity);
            }
            else
            {
                var activityDb = _chalkboardEntities.Activities.FirstOrDefault(_a => _a.Id == activity.Id);
                _chalkboardEntities.Entry(activityDb).CurrentValues.SetValues(activity);

            }
            _chalkboardEntities.SaveChanges();

            if (activityModel.Images != null && activityModel.Images.Count() > 0)
            {
                foreach (var image in activityModel.Images)
                {
                    string path = $"{AppDomain.CurrentDomain.BaseDirectory}\\{group.Path}\\{activity.Id.ToString()}\\Images";
                    Directory.CreateDirectory(path);
                    //empty directory
                    var directory = new DirectoryInfo(path);
                    foreach (System.IO.FileInfo file in directory.GetFiles())
                    {
                        file.Delete();
                    }
                    //save new files
                    string fileName = $"{ Path.GetRandomFileName() }.{ Path.GetExtension(image.FileName)}";
                    using (var originalImage = Image.FromStream(image.InputStream, true, true))
                    {
                        originalImage.Save($"{path}\\{fileName}");
                        //Create ThumbNail
                        string thumbNailFileName = $"{ Path.GetRandomFileName() }-thumbnail.{ Path.GetExtension(image.FileName)}";
                        originalImage.GetThumbnailImage(444, 606, () => false, IntPtr.Zero).Save(thumbNailFileName);
                        fileNames += "${fileName},";
                    }
                }
                //update only filenames in the database
                activity.ActivityImages = fileNames;
                _chalkboardEntities.Activities.Attach(activity);
                _chalkboardEntities.Entry(activity).Property(x => x.ActivityImages).IsModified = true;
                _chalkboardEntities.SaveChanges();
            }

            return _mapper.Map<ActivityModel>(activity);
        }

        public bool PublishActivity(int activityId)
        {
            var activityDb = _chalkboardEntities.Activities.FirstOrDefault(_a => _a.Id == activityId);
            activityDb.IsPublished = true;
            _chalkboardEntities.Activities.Attach(activityDb);
            _chalkboardEntities.Entry(activityDb).Property(x => x.ActivityImages).IsModified = true;
            _chalkboardEntities.SaveChanges();
            return true;
        }



    }
}
