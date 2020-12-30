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

namespace RepairServices
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        RepairServicesEntities db = new RepairServicesEntities();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void ButtonOpenMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonOpenMenu.Visibility = Visibility.Collapsed;
            ButtonCloseMenu.Visibility = Visibility.Visible;
            logoOpen.Visibility = Visibility.Visible;
            logoClose.Visibility = Visibility.Collapsed;
        }

        private void ButtonCloseMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonOpenMenu.Visibility = Visibility.Visible;
            ButtonCloseMenu.Visibility = Visibility.Collapsed;
            logoOpen.Visibility = Visibility.Collapsed;
            logoClose.Visibility = Visibility.Visible;
        }

        private void Exit(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Click_Minimized(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }

        private void ListViewItem_Selected(object sender, RoutedEventArgs e)
        {
            TabIcon.Kind = MaterialDesignThemes.Wpf.PackIconKind.DatabaseSearch;
            TabName.Text = "Просмотр данных";
            mainFrame.NavigationService.Navigate(new Pages.OutputDataPage());
        }

        private void ListViewItem_Selected_1(object sender, RoutedEventArgs e)
        {
            TabIcon.Kind = MaterialDesignThemes.Wpf.PackIconKind.DatabaseAdd;
            TabName.Text = "Добавить запись";
            mainFrame.NavigationService.Navigate(new Pages.AddDataPage());
        }

        private void ListViewItem_Selected_2(object sender, RoutedEventArgs e)
        {
            TabIcon.Kind = MaterialDesignThemes.Wpf.PackIconKind.DatabaseEdit;
            TabName.Text = "Редактировать запись";
            mainFrame.NavigationService.Navigate(new Pages.EditDataPage());
        }

        private void ListViewItem_Selected_3(object sender, RoutedEventArgs e)
        {
            TabIcon.Kind = MaterialDesignThemes.Wpf.PackIconKind.Information;
            TabName.Text = "О программе";
            mainFrame.NavigationService.Navigate(new Pages.InfoPage());
        }

        private void Click_Maximized(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Maximized;
            btMaximized.Visibility = Visibility.Collapsed;
            btMinimized.Visibility = Visibility.Visible;
        }

        private void Click_Minimized2(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Normal;
            btMaximized.Visibility = Visibility.Visible;
            btMinimized.Visibility = Visibility.Collapsed;
        }
    }
}
