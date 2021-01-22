using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mealprep.Repo
{
    interface IRepo<T>
    {
        void Add(T newElement);
        void Del(int id);

        void Del(T element);
        IQueryable<T> GetAll();
        T GetById(int id);
        int LastId();
        int FirstEmptyId();
        void UpdateElement(T newElement);
        bool FindId(int id);
    }
}
