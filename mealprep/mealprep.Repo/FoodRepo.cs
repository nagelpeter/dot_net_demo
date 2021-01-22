using mealprep.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mealprep.Repo
{
    public class FoodRepo : IRepo<Food>
    {
        private DBEntities db;

        public FoodRepo()
        {
            this.db = new DBEntities();
        }
        public void Add(Food newElement)
        {
            this.db.Foods.Add(newElement);
            this.db.SaveChanges();
        }

        public void Del(int id)
        {
            this.db.Foods.Remove(this.GetById(id));
        }

        public void Del(Food element)
        {
            this.db.Foods.Remove(element);
        }

        public bool FindId(int id)
        {
            return this.GetAll().Any(x => x.FoodID == id);
        }

        public int FirstEmptyId()
        {
            throw new NotImplementedException();
        }

        public IQueryable<Food> GetAll()
        {
            return this.db.Foods;
        }

        public Food GetById(int id)
        {
            var result = this.db.Foods.FirstOrDefault(x => x.FoodID == id);
            return result;
        }

        public int LastId()
        {
            return (int)this.db.Recipes.Max(x => x.FoodID);
        }

        public void UpdateElement(Food newElement)
        {
            this.db.Foods.AddOrUpdate(newElement);
            this.db.SaveChanges();
        }
    }
}
