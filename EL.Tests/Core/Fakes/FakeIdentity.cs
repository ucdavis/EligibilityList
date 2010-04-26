using System;
using System.Security.Principal;

namespace EL.Tests.Core.Fakes
{
    public class FakeIdentity : IIdentity
    {
        public string Name
        {
            get;
            set;
        }

        public string AuthenticationType
        {
            get { throw new NotImplementedException(); }
        }

        public bool IsAuthenticated
        {
            get;
            set;
        }
    }
}