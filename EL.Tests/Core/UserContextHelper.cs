using System.Security.Principal;
using EL.Tests.Core.Fakes;
using Rhino.Mocks;

namespace EL.Tests.Core
{
    public static class UserContextHelper
    {
        public static IPrincipal StubIPrincipal()
        {
            return StubIPrincipal(null, false, false);
        }

        public static IPrincipal StubIPrincipal(string name, bool isAdmin, bool isUser)
        {
            var principal = MockRepository.GenerateStub<IPrincipal>();
            principal.Expect(p => p.Identity).Return(new FakeIdentity { Name = name });
            principal.Expect(p => p.IsInRole("Admin")).Return(isAdmin);
            principal.Expect(p => p.IsInRole("User")).Return(isUser);

            return principal;
        }
    }
}