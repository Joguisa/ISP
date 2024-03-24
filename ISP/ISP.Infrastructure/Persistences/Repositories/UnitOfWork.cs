using ISP.Infrastructure.Persistences.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace POS.Infrastructure.Persistences.Repositories
{
    public class UnitOfWork 
        //: IUnitOfWork
    {
        //private readonly mycontext _context;

        //public UnitOfWork(mycontext context, IConfiguration configuration)
        //{
        //    _context = context;
        //}

        //public void Dispose()
        //{
        //    // liberar los recursos de la memoria
        //    _context.Dispose();
        //}

        //public void SaveChanges()
        //{
        //    // guardar los cambios en la base de datos
        //    _context.SaveChanges();
        //}

        //public async Task SaveChangesAsync()
        //{
        //    // guardar los cambios en la base de datos
        //    await _context.SaveChangesAsync();
        //}
    }
}
