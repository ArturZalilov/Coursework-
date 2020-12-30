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

namespace RepairServices.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditDataPage.xaml
    /// </summary>
    public partial class EditDataPage : Page
    {
        RepairServicesEntities db = new RepairServicesEntities();

        public EditDataPage()
        {
            InitializeComponent();

            db.Клиенты.Load();
            db.Услуги.Load();
            db.Заказы.Load();
            db.Использованные_материалы.Load();
            db.Оказанные_услуги.Load();
            db.Материалы.Load();
            db.Сотрудники.Load();

            var clients = from i in db.Клиенты
                          select i;
            dgClients.ItemsSource = clients.ToList();
            var order = from i in db.Заказы
                        select i;
            dgOrders.ItemsSource = order.ToList();
            var serviceRender = from i in db.Оказанные_услуги
                                select i;
            dgServRend.ItemsSource = serviceRender.ToList();
        }


        private void btSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();

            }
            catch
            {
                MessageBox.Show("Ошибка сохранения данных. Возможная причина: несоответствие измененных значений типу данных поля.", "Ошибка");
            }
        }

        private void btDeleteClient_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                db.Клиенты.Load();
                Клиенты клиент = dgClients.SelectedItem as Клиенты;
                db.Клиенты.Attach(клиент);
                db.Клиенты.Remove(клиент);
                db.SaveChanges();
            }
            catch
            {
                MessageBox.Show("Ошибка удаления записи","Предупреждение");
            }
        }

        private void btDeleteOrder_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                db.Заказы.Load();
                Заказы заказ = dgOrders.SelectedItem as Заказы;
                db.Заказы.Attach(заказ);
                db.Заказы.Remove(заказ);
                db.SaveChanges();
            }
            catch
            {
                MessageBox.Show("Ошибка удаления записи", "Предупреждение");
            }
        }

        private void btDeleteServiceRend_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                db.Оказанные_услуги.Load();
                Оказанные_услуги оказ_услуг = dgServRend.SelectedItem as Оказанные_услуги;
                db.Оказанные_услуги.Attach(оказ_услуг);
                db.Оказанные_услуги.Remove(оказ_услуг);
                db.SaveChanges();
            }
            catch
            {
                MessageBox.Show("Ошибка удаления записи", "Предупреждение");
            }
        }
    }
}
