using mealprep.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mealprep.Repo
{
    class RecipeRepo : IRepo<Recipe>
    {
        private DBEntities db;

        public RecipeRepo()
        {
            this.db = new DBEntities();
        }
        public void Add(Recipe newElement)
        {
            this.db.Recipes.Add(newElement);
            this.db.SaveChanges();
        }

        public void Del(int id)
        {
            this.db.Recipes.Remove(this.GetById(id));
            this.db.SaveChanges();
        }

        public void Del(Recipe element)
        {
            this.db.Recipes.Remove(element);
        }

        public bool FindId(int id)
        {
            return this.GetAll().Any(x => x.RecipeID == id);
        }

        public int FirstEmptyId()
        {
            throw new NotImplementedException();
        }

        public IQueryable<Recipe> GetAll()
        {
            return this.db.Recipes;
        }

        public Recipe GetById(int id)
        {
            var result = this.db.Recipes.FirstOrDefault(x => x.RecipeID == id);
            return result;
        }

        public int LastId()
        {
            return (int)this.db.Recipes.Max(x => x.RecipeID);
        }

        public void UpdateElement(Recipe newElement)
        {
            this.db.Recipes.AddOrUpdate(newElement);
            this.db.SaveChanges();
        }
    }
}
