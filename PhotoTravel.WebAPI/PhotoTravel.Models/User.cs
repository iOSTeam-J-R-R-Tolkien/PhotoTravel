using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace PhotoTravel.Models
{
    public class User
    {
        [DataMember(Name = "Id")]
        public int Id { get; set; }

        [DataMember(Name = "FbId")]
        public string FbId { get; set; }

        [DataMember(Name = "Username")]
        public string Username { get; set; }

        [DataMember(Name = "Link")]
        public string Link { get; set; }

        [DataMember(Name = "Email")]
        public string Email { get; set; }

        [DataMember(Name = "Location")]
        public string Location { get; set; }

        [DataMember(Name = "Birthday")]
        public string Birthday { get; set; }

        //TODO: implement Posts
        //public ICollection<Post> Posts { get; set; }
    }
}
