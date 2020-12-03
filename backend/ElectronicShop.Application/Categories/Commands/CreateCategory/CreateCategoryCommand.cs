using System.Threading;
using System.Threading.Tasks;
using MediatR;

namespace ElectronicShop.Application.Categories.Commands.CreateCategory
{
    public class CreateCategoryCommand : IRequest<int>
    {
        
    }

    public class CreateCategoryHandle : IRequestHandler<CreateCategoryCommand, int>
    {
        public Task<int> Handle(CreateCategoryCommand request, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }
    }
}