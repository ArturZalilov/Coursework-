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
using Word = Microsoft.Office.Interop.Word;

namespace RepairServices.Pages.PagesForAddData
{
    /// <summary>
    /// Логика взаимодействия для ClientsPage.xaml
    /// </summary>
    public partial class ClientsPage : Page
    {

        RepairServicesEntities db = new RepairServicesEntities();

        public ClientsPage()
        {
            InitializeComponent();
        }

        private void btAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (tbLastName.Text == "" || tbFirstName.Text == "" || tbPatronymic.Text == "" || tbPatronymic.Text == "" || tbAddress.Text == "" )
                {
                    MessageBox.Show("Заполните все необходимые для заполнения поля!", "Предупреждения");
                }
                else
                {
                    db.Клиенты.Load();
                    Клиенты client = new Клиенты()
                    {
                        Фамилия = Convert.ToString(tbLastName.Text),
                        Имя = Convert.ToString(tbFirstName.Text),
                        Отчество = Convert.ToString(tbPatronymic.Text),
                        Телефон = Convert.ToString(tbPhone.Text),
                        Адрес = Convert.ToString(tbAddress.Text),
                        Email = Convert.ToString(tbEmail.Text)
                    };
                    db.Клиенты.Add(client);
                    db.SaveChanges();
                }
            }
            catch
            {
                MessageBox.Show("Ошибка ввода данных","Ошибка");
            }
            
        }
    }
}
