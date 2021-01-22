using mealprep.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mealprep.Repo
{
    class AllergenCTRepo : IRepo<AllergensCT>
    {
        private DBEntities db;

        public AllergenCTRepo()
        {
            this.db = new DBEntities();
        }
        public void Add(AllergensCT newElement)
        {
            this.db.AllergensCTs.Add(newElement);
            this.db.SaveChanges();
        }

        public void Del(int id)
        {
            this.db.AllergensCTs.Remove(this.GetById(id));
            this.db.SaveChanges();
        }

        public void Del(AllergensCT element)
        {
            this.db.AllergensCTs.Remove(element);
        }

        public bool FindId(int id)
        {
            return this.GetAll().Any(x => x.AllergensCTID == id);
        }

        public int FirstEmptyId()
        {
            throw new NotImplementedException();
        }

        public IQueryable<AllergensCT> GetAll()
        {
            return this.db.AllergensCTs;
        }

        public AllergensCT GetById(int id)
        {
            var result = this.db.AllergensCTs.FirstOrDefault(x => x.AllergensCTID == id);
            return result;
        }

        public int LastId()
        {
            return (int)this.db.AllergensCTs.Max(x => x.AllergensCTID);
        }

        public void UpdateElement(AllergensCT newElement)
        {
            this.db.AllergensCTs.AddOrUpdate(newElement);
            this.db.SaveChanges();
        }
    }
}
