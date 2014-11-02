using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PhotoTravel.Models;

namespace PhotoTravel.Data
{
    public class UsersRepository : GenericRepository<User>, IUsersRepository
    {
        public UsersRepository(DbContext context)
            : base(context)
        {
        }

        public IQueryable<User> AllNotDeleted()
        {
            return this.DbSet.AsQueryable();
        }
    }
}
