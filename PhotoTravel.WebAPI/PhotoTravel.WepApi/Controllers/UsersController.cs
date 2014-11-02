using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PhotoTravel.Models;
using PhotoTravel.WepApi.Models;

namespace PhotoTravel.WepApi.Controllers
{
    public class UsersController : BaseController
    {
        [HttpPost]
        [ActionName("register")]
        public HttpResponseMessage Register([FromBody] UserRegisterRequestModel userModel)
        {
            var responseMessage = this.TryExecuteOperation(() =>
            {
                //UserValidator.ValidateAuthCode(userModel.RegistrationAuthCode);

                var doesCodeExist = this.db.Users.All()
                        .FirstOrDefault(
                        x => x.FbId == userModel.FbId);

                if (doesCodeExist != null)
                {
                    throw new InvalidOperationException("The Authification code is wrong!");
                }

                User user = UserRegisterRequestModel.ToEntity(userModel);


                #region Checks for del
                //user.Username = doesCodeExist.Email;
                //user.UserType = doesCodeExist.Type;

                //UserValidator.ValidateEmail(user.Username);
                //UserValidator.ValidateName(user.FirstName);
                //UserValidator.ValidateName(user.SecondName);
                //UserValidator.ValidateName(user.LastName);



                //if (user.UserType == UserType.Administrator ||
                //    user.UserType == UserType.Dealer)
                //{
                //    var isFirstAdminUser = this.unitOfWork.userRepository.All()
                //              .FirstOrDefault(
                //                              x =>
                //                              x.UserType == UserType.Administrator);
                //    if (isFirstAdminUser == null &&
                //        user.UserType == UserType.Dealer)
                //    {
                //        throw new InvalidOperationException("First user can not be a Dealer!");
                //    }
                //    else if (isFirstAdminUser == null)
                //    {
                //        Company newCompany = UserRegisterRequestModel.ToEntityCompany(userModel);

                //        foreach (string phone in userModel.CompanyData.CompanyPhones)
                //        {
                //            var newPhone = new Phone()
                //            {
                //                Number = phone
                //            };
                //            unitOfWork.phoneRepository.Add(newPhone);

                //            newCompany.Phones.Add(newPhone);
                //        }

                //        foreach (string mail in userModel.CompanyData.CompanyMails)
                //        {
                //            var newEmail = new Email()
                //            {
                //                Name = mail
                //            };
                //            unitOfWork.emailRepository.Add(newEmail);

                //            newCompany.Mails.Add(newEmail);
                //        }
                //        //Company newCompany = new Company()
                //        //{
                //        //    DisplayName = userModel.CompanyDisplayName,
                //        //    Name = userModel.CompanyName,
                //        //    CompanyType = CompanyType.Owner,
                //        //    Fax = userModel.Fax
                //        //};
                //        unitOfWork.companyRepository.Add(newCompany);
                //        user.Company = newCompany;
                //    }
                //    else
                //    {
                //        user.Company = isFirstAdminUser.Company;
                //    }
                //}
                //else
                //{
                //    user.Company = doesCodeExist.Company;
                //}

                //var doesUserExist =
                //    this.unitOfWork.userRepository.All()
                //              .FirstOrDefault(
                //                              x =>
                //                              x.Username.ToLower() == user.Username.ToLower());
                ////||
                ////x.DisplayName.ToLower() == user.DisplayName.ToLower());
                //if (doesUserExist != null)
                //{
                //    throw new InvalidOperationException("User already exist in the database!");
                //}


                //foreach (string phone in userModel.Phones)
                //{
                //    var newPhone = new Phone()
                //    {
                //        Number = phone
                //    };
                //    unitOfWork.phoneRepository.Add(newPhone);

                //    user.Phones.Add(newPhone);
                //}

                //foreach (string mail in userModel.Mails)
                //{
                //    var newEmail = new Email()
                //    {
                //        Name = mail
                //    };
                //    unitOfWork.emailRepository.Add(newEmail);

                //    user.Mails.Add(newEmail);
                //}

                ////register all new users as clients
                ////user.UserType = UserType.Client; 
                #endregion

                this.db.Users.Add(user);
                db.SaveChanges();
                //user.SessionKey = SessionGenerator.GenerateSessionKey(user.Id);
                //this.unitOfWork.userRepository.Update(user.Id, user);

                //doesCodeExist.IsUsed = true;
                //if (doesCodeExist.NewUser == null)
                //{
                //    doesCodeExist.NewUser = user;
                //}
                //this.unitOfWork.newUserAuthCodeRepository.Update(doesCodeExist.Id, doesCodeExist);


                var response = this.Request.CreateResponse(HttpStatusCode.Created,
                    UserRegisterResponseModel.FromEntity(user//,
                                                            //user.Mails.Select(x => x.Name).ToArray(),
                                                            //user.Phones.Select(x => x.Number).ToArray(),
                                                            //CompanyModel.FromEntity(user.Company,
                                                            //                        user.Company.Mails.Select(x => x.Name).ToArray(),
                                                            //                        user.Company.Phones.Select(x => x.Number).ToArray())
                                                            ));

                return response;
            });

            return responseMessage;
        }
    }
}
