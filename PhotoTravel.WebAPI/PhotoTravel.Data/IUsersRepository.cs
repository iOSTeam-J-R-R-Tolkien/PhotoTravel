using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PhotoTravel.Models;

namespace PhotoTravel.Data
{
    public interface IUsersRepository: IRepository<User>
    {
        IQueryable<User> AllNotDeleted();
    }
}
