﻿using ISP.Domain.Entities;
using ISP.Infrastructure.Commons.Bases.Request;
using System.Linq.Expressions;

namespace ISP.Infrastructure.Persistences.Interfaces
{
    /* 
     * Esta interfaz es la base para los repositorios, 
     * contiene los métodos que son comunes para todos los repositorios
    */
    public interface IGenericRepository<T> where T : BaseEntity
    {
        //Task<IEnumerable<T>> GetAllAsync();
        //Task<T> GetByIdAsync(int id);
        //Task<bool> RegisterAsync(T entity);
        //Task<bool> EditAsync(T entity);
        //Task<bool> RemoveAsync(int id);

        //IQueryable<T> GetEntityQuery(Expression<Func<T, bool>>? filter = null);
        //IQueryable<TDTO> Ordering<TDTO>(BasePaginationRequest request, IQueryable<TDTO> queryable, bool pagination = false) where TDTO : class;

    }
}
