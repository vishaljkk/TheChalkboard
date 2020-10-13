using Chalkboard.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Chalkboard.Business
{
    public abstract class BaseBusiness
    {
        protected AutoMapper.Mapper _mapper;
        protected ChalkboardEntities _chalkboardEntities;

        public BaseBusiness()
        {
            _mapper = new AutoMapper.Mapper(Mapper.MapperSetup._configuration);
            _chalkboardEntities = new ChalkboardEntities();
        }


    }
}
