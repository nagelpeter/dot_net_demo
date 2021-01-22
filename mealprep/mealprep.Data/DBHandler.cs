using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mealprep.Data
{
    public class DBHandler
    {
        static DBHandler()
        {
            DB = new DBEntities1;
        }

        public static DBEntities DB { get; }
    }
}
