using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для AddDataPage.xaml
    /// </summary>
    public partial class AddDataPage : Page
    {

        public AddDataPage()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (cbTableName.Text == "Клиенты")
            {
                mainFrame.NavigationService.Navigate(new Pages.PagesForAddData.ClientsPage());
            }
            else if (cbTableName.Text == "Заказы")
            {
                mainFrame.NavigationService.Navigate(new Pages.PagesForAddData.OrdersPage());
            }
            else if (cbTableName.Text == "Оказанные услуги")
            {
                mainFrame.NavigationService.Navigate(new Pages.PagesForAddData.ServRendPage());
            }
            else
            {
                MessageBox.Show("Error");
            }
        }
    }
}
