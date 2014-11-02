using System;
using System.Data.Entity;
using System.Linq;
using PhotoTravel.Models;

namespace PhotoTravel.Data
{
    public class DataContext : DbContext
    {
        public DataContext(string contextString)
            :base (contextString)
        {
        }

        public DataContext()
            : base("SQLSERVER_CONNECTION_STRING")
        {
        }

        public IDbSet<User> Users { get; set; }
    }
}
