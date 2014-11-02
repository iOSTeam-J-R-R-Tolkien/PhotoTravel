using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PhotoTravel.Models;

namespace PhotoTravel.Data
{
    public interface IDataContext
    {
        IDbSet<User> Users { get; set; }
    }
}
