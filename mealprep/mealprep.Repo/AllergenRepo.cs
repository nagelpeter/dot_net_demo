using mealprep.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mealprep.Repo
{
    class AllergenRepo : IRepo<Allergen>
    {
        private DBEntities db;

        public AllergenRepo()
        {
            this.db = new DBEntities();
        }
        public void Add(Allergen newElement)
        {
            this.db.Allergens.Add(newElement);
            this.db.SaveChanges();
        }

        public void Del(int id)
        {
            this.db.Allergens.Remove(this.GetById(id));
            this.db.SaveChanges();
        }

        public void Del(Allergen element)
        {
            this.db.Allergens.Remove(element);
        }

        public bool FindId(int id)
        {
            return this.GetAll().Any(x => x.AllergenID == id);
        }

        public int FirstEmptyId()
        {
            throw new NotImplementedException();
        }

        public IQueryable<Allergen> GetAll()
        {
            return this.db.Allergens;
        }

        public Allergen GetById(int id)
        {
            var result = this.db.Allergens.FirstOrDefault(x => x.AllergenID == id);
            return result;
        }

        public int LastId()
        {
            return (int)this.db.Allergens.Max(x => x.AllergenID);
        }

        public void UpdateElement(Allergen newElement)
        {
            this.db.Allergens.AddOrUpdate(newElement);
            this.db.SaveChanges();
        }
    }
}
