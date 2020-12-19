//using ElectronicShop.Application.Authentications.Services;
//using MediatR;
//using System.Threading;
//using System.Threading.Tasks;

//namespace ElectronicShop.Application.Authentications.Commands.SignOut
//{
//    public class SignOutCommand : IRequest<Unit>
//    {

//    }

//    public class SignOutHandle : IRequestHandler<SignOutCommand>
//    {
//        private readonly IAuthService _authService;

//        public SignOutHandle(IAuthService authService)
//        {
//            _authService = authService;
//        }

//        public async Task Handle(SignOutCommand request, CancellationToken cancellationToken)
//        {
//            await _authService.SignOutAsync();

//        }
//    }
//}
