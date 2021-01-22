using mealprep.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mealprep.Repo
{
    class IngredientRepo : IRepo<Ingredient>
    {
        private DBEntities db;

        public IngredientRepo()
        {
            this.db = new DBEntities();
        }
        public void Add(Ingredient newElement)
        {
            this.db.Ingredients.Add(newElement);
            this.db.SaveChanges();
        }

        public void Del(int id)
        {
            this.db.Ingredients.Remove(this.GetById(id));
            this.db.SaveChanges();
        }

        public void Del(Ingredient element)
        {
            this.db.Ingredients.Remove(element);
            this.db.SaveChanges();
        }

        public bool FindId(int id)
        {
            return this.GetAll().Any(x => x.IngredientID == id);
        }

        public int FirstEmptyId()
        {
            throw new NotImplementedException();
        }

        public IQueryable<Ingredient> GetAll()
        {
            return this.db.Ingredients;
        }

        public Ingredient GetById(int id)
        {
            var result = this.db.Ingredients.FirstOrDefault(x => x.IngredientID == id);
            return result;
        }

        public int LastId()
        {
            return (int)this.db.Ingredients.Max(x => x.IngredientID);
        }

        public void UpdateElement(Ingredient newElement)
        {
            this.db.Ingredients.AddOrUpdate(newElement);
            this.db.SaveChanges();
        }
    }
}
