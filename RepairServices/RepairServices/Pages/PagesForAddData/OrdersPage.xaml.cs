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
    /// Логика взаимодействия для OrdersPage.xaml
    /// </summary>
    public partial class OrdersPage : Page
    {
        RepairServicesEntities db = new RepairServicesEntities();

        public OrdersPage()
        {
            InitializeComponent();
        }

        private void btAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                db.Заказы.Load();
                Заказы order = new Заказы()
                {
                    Код_клиента = Convert.ToInt32(tbCodeClient.Text),
                    Дата_заказа = Convert.ToDateTime(tbDateOrder.Text),
                    Описание = Convert.ToString(tbDescription.Text)
                };
                db.Заказы.Add(order);
                db.SaveChanges();
            }
            catch
            {
                MessageBox.Show("Ошибка ввода данных","Ошибка");
            }
            
        }
    }
}
