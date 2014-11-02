using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using PhotoTravel.Models;

namespace PhotoTravel.WepApi.Models
{
    public class UserRegisterRequestModel
    {
        public static Func<UserRegisterRequestModel, User> ToEntity { get; set; }

        //public static Func<UserRegisterRequestModel, Company> ToEntityCompany { get; set; }

        public string Username { get; set; }

        //public string FirstName { get; set; }

        //public string SecondName { get; set; }

        //public string LastName { get; set; }

        //public string AuthCode { get; set; }

        //public string RegistrationAuthCode { get; set; }

        public string Email { get; set; }

        //public ICollection<string> Phones { get; set; }

        //public UserType UserType { get; set; }


        //[DataMember(Name = "Company")]
        //public CompanyModel CompanyData { get; set; }

        //public string CompanyName { get; set; }

        //public string CompanyDisplayName { get; set; }

        //public string Fax { get; set; }

        //public string CompanyMoreInformation { get; set; }

        //public string CompanyLocation { get; set; }

        //public ICollection<string> CompanyMails { get; set; }

        //public ICollection<string> CompanyPhones { get; set; }

        public string Location { get; set; }

        public string Link { get; set; }

        public string Birthday { get; set; }

        public string FbId { get; set; }

        static UserRegisterRequestModel()
        {
            ToEntity = x => new User
            {
                Username = x.Username,
                Birthday = x.Birthday,
                Email = x.Email,
                FbId = x.FbId,
                Link = x.Link,
                Location = x.Location
                //FirstName = x.FirstName,
                //SecondName = x.SecondName,
                //LastName = x.LastName, 
                //AuthCode = x.AuthCode, 
                //UserType = x.UserType
                //,
                //Location = x.Location
            };
        }
    }

    [DataContract]
    public class UserRegisterResponseModel
    {
        public static Func<User, /*string[], string[], CompanyModel,*/ UserRegisterResponseModel> FromEntity { get; set; }

        //[DataMember(Name = "SessionKey")]
        //public string SessionKey { get; set; }

        [DataMember(Name = "FbId")]
        public string FbId { get; set; }

        [DataMember(Name = "UserName")]
        public string UserName { get; set; }

        //[DataMember(Name = "Company")]
        //public CompanyModel Company { get; set; }

        //[DataMember(Name = "Username")]
        //public string Username { get; set; }

        //[DataMember(Name = "FirstName")]
        //public string FirstName { get; set; }

        //[DataMember(Name = "SecondName")]
        //public string SecondName { get; set; }

        //[DataMember(Name = "LastName")]
        //public string LastName { get; set; }

        [DataMember(Name = "Mails")]
        public string Email { get; set; }

        //[DataMember(Name = "Phones")]
        //public ICollection<string> Phones { get; set; }

        //[DataMember(Name = "UserType")]
        //public UserType UserType { get; set; }

        [DataMember(Name = "Birthday")]
        public string Birthday { get; set; }

        [DataMember(Name = "Location")]
        public string Location { get; set; }

        [DataMember(Name = "Link")]
        public string Link { get; set; }

        static UserRegisterResponseModel()
        {
            FromEntity = u /*m, p, c*/ => new UserRegisterResponseModel
            {
                FbId = u.FbId,
                UserName = u.Username,
                Link=u.Link,
                Location=u.Location,
                Birthday = u.Birthday,
                Email = u.Email
                //FirstName = u.FirstName,
                //SecondName = u.SecondName,
                //LastName = u.LastName,

                //Phones = p,
                //SessionKey = u.SessionKey,
                //UserType = u.UserType,
                //Company = c
            };
        }
    }


}