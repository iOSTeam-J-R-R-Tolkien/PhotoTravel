using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PhotoTravel.Data
{
    public interface IUowData : IDisposable
    {
        IUsersRepository Users { get; }

        int SaveChanges();
    }
}
