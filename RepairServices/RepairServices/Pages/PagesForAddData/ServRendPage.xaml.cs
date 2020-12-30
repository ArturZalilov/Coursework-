using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RepairServices.Pages.PagesForAddData
{
    /// <summary>
    /// Логика взаимодействия для ServRendPage.xaml
    /// </summary>
    public partial class ServRendPage : Page
    {
        RepairServicesEntities db = new RepairServicesEntities();

        public ServRendPage()
        {
            InitializeComponent();
        }

        private void btAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                db.Оказанные_услуги.Load();
                Оказанные_услуги serviceRend = new Оказанные_услуги()
                {
                    Код_услуги = Convert.ToInt32(tbCodeService.Text),
                    Номер_заказа = Convert.ToInt32(tbNumberOrder.Text),
                    Номер_сотрудника = Convert.ToInt32(tbNumberStaff.Text),
                    Количество = Convert.ToInt32(tbCount.Text),
                    Примечание = tbDescription.Text
                };
                db.Оказанные_услуги.Add(serviceRend);
                db.SaveChanges();
            }
            catch
            {
                MessageBox.Show("Ошибка ввода данных", "Ошибка");
            }
        }
    }
}
