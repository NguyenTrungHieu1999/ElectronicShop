using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Categories.Commands.CreateCategory
{
    public class CreateCategoryCommand : IRequest<int>
    {
        public string Name { get; set; }
        
        public string Alias { get; set; }
        
        public int? RootId { get; set; }
        
        public int ProductTypeId { get; set; }
    }

    public class CreateCategoryHandle : IRequestHandler<CreateCategoryCommand, int>
    {
        public Task<int> Handle(CreateCategoryCommand request, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }
    }
}