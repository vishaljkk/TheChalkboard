using AutoMapper;
using Chalkboard.DatabaseModels;
using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Mapper
{
    public class MapperSetup
    {
        private static IMapperConfigurationExpression MapperConfiguration { get; set; }

        public static MapperConfiguration _configuration;

        public static void Setup()
        {

            _configuration = new MapperConfiguration(cfg =>
            {
                MapperConfiguration = cfg;

                MapperConfiguration.CreateMap<User, RegistrationModel>()
                .ForMember(x => x.EmailId, opts => opts.MapFrom(x => x.UserName))
                .ForMember(x => x.Password, opts => opts.MapFrom(x => x.Password)).ReverseMap();

                MapperConfiguration.CreateMap<UserProfile, RegistrationModel>()
                .ForMember(x => x.EmailId, opts => opts.MapFrom(x => x.Email))
                .ForMember(x => x.UserName, opts => opts.MapFrom(x => x.FirstName)).ReverseMap();

                MapperConfiguration.CreateMap<Chalkboard.DatabaseModels.Profile, RegistrationModel>()
                .ForMember(x => x.UserName, opts => opts.MapFrom(x => x.ProfileName)).ReverseMap();

                MapperConfiguration.CreateMap<Chalkboard.DatabaseModels.Profile, ProfileModel>()
                .ForMember(x => x.ProfileName, opts => opts.MapFrom(x => x.ProfileName))
                .ForMember(x => x.ProfileId, opts => opts.MapFrom(x => x.Id))
                .ForMember(x => x.Status, opts => opts.MapFrom(x => x.Status))
                .ForMember(x => x.CreatedBy, opts => opts.MapFrom(x => x.CreatedBy))
                .ForMember(x => x.CreatedDate, opts => opts.MapFrom(x => x.CreatedDate))
                .ForMember(x => x.UpdatedBy, opts => opts.MapFrom(x => x.UpdatedBy))
                .ForMember(x => x.UpdatedDate, opts => opts.MapFrom(x => x.UpdatedDate)).ReverseMap();

                MapperConfiguration.CreateMap<Chalkboard.DatabaseModels.Group, GroupModel>()
               .ForMember(x => x.GroupId, opts => opts.MapFrom(x => x.Id))
               .ForMember(x => x.GroupName, opts => opts.MapFrom(x => x.GroupName))
               .ForMember(x => x.ActivityModels, opts => opts.MapFrom(x => x.Activities))
               .ForMember(x => x.Path, opts => opts.MapFrom(x => x.Path))
               .ForMember(x => x.Status, opts => opts.MapFrom(x => x.Status))
               .ForMember(x => x.CreatedBy, opts => opts.MapFrom(x => x.CreatedBy))
               .ForMember(x => x.CreatedDate, opts => opts.MapFrom(x => x.CreatedDate))
               .ForMember(x => x.UpdatedBy, opts => opts.MapFrom(x => x.UpdatedBy))
               .ForMember(x => x.UpdatedDate, opts => opts.MapFrom(x => x.UpdatedDate)).ReverseMap();

                MapperConfiguration.CreateMap<Chalkboard.DatabaseModels.GroupMember, GroupMemberModel>()
                .ForMember(x => x.GroupMemberId, opts => opts.MapFrom(x => x.Id))
                .ForMember(x => x.GroupRoleId, opts => opts.MapFrom(x => x.GroupRoleId))
                .ForMember(x => x.Status, opts => opts.MapFrom(x => x.Status))
                .ForMember(x => x.CreatedBy, opts => opts.MapFrom(x => x.CreatedBy))
                .ForMember(x => x.CreatedDate, opts => opts.MapFrom(x => x.CreatedDate))
                .ForMember(x => x.UpdatedBy, opts => opts.MapFrom(x => x.UpdatedBy))
                .ForMember(x => x.UpdatedDate, opts => opts.MapFrom(x => x.UpdatedDate)).ReverseMap();

                MapperConfiguration.CreateMap<Chalkboard.DatabaseModels.Activity, ActivityModel>()
                .ForMember(x => x.ActivityId, opts => opts.MapFrom(x => x.Id))
                .ForMember(x => x.ActivityDescription, opts => opts.MapFrom(x => x.ActivityDescription))
                .ForMember(x => x.ActivityName, opts => opts.MapFrom(x => x.ActivityName))
                .ForMember(x => x.ActivityTypeId, opts => opts.MapFrom(x => x.ActivityTypeId))
                .ForMember(x => x.ActivityStartDate, opts => opts.MapFrom(x => x.ActivityStartDate))
                .ForMember(x => x.ActivityEndDate, opts => opts.MapFrom(x => x.ActivityEndDate))
                .ForMember(x => x.ActivityEntryModels, opts => opts.MapFrom(x => x.ActivityEntries))
                .ForMember(x => x.ActivityImages, opts => opts.MapFrom(x => x.ActivityImages))
                .ForMember(x => x.GroupId, opts => opts.MapFrom(x => x.GroupId))
                .ForMember(x => x.IsPublished, opts => opts.MapFrom(x => x.IsPublished))
                .ForMember(x => x.Status, opts => opts.MapFrom(x => x.Status))
                .ForMember(x => x.CreatedBy, opts => opts.MapFrom(x => x.CreatedBy))
                .ForMember(x => x.CreatedDate, opts => opts.MapFrom(x => x.CreatedDate))
                .ForMember(x => x.UpdatedBy, opts => opts.MapFrom(x => x.UpdatedBy))
                .ForMember(x => x.UpdatedDate, opts => opts.MapFrom(x => x.UpdatedDate)).ReverseMap();

                MapperConfiguration.CreateMap<Chalkboard.DatabaseModels.ActivityEntry, ActivityEntryModel>()
                .ForMember(x => x.ActivityEntryId, opts => opts.MapFrom(x => x.Id))
                .ForMember(x => x.Entry, opts => opts.MapFrom(x => x.Entry))
                .ForMember(x => x.IsPublished, opts => opts.MapFrom(x => x.IsPublished))
                .ForMember(x => x.ActivityId, opts => opts.MapFrom(x => x.ActivitiesId))
                .ForMember(x => x.Status, opts => opts.MapFrom(x => x.Status))
                .ForMember(x => x.CreatedBy, opts => opts.MapFrom(x => x.CreatedBy))
                .ForMember(x => x.CreatedDate, opts => opts.MapFrom(x => x.CreatedDate))
                .ForMember(x => x.UpdatedBy, opts => opts.MapFrom(x => x.UpdatedBy))
                .ForMember(x => x.UpdatedDate, opts => opts.MapFrom(x => x.UpdatedDate))
                .ReverseMap();

            });


        }
    }
}
