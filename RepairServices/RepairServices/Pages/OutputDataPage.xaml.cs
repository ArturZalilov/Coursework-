using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
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
using Excel = Microsoft.Office.Interop.Excel;

namespace RepairServices.Pages
{
    /// <summary>
    /// Логика взаимодействия для OutputDataPage.xaml
    /// </summary>
    public partial class OutputDataPage : Page
    {
        RepairServicesEntities db = new RepairServicesEntities();

        public OutputDataPage()
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
            var services = from i in db.Услуги
                           select i;
            dgServices.ItemsSource = services.ToList();
            var order = from i in db.Заказы
                        select i;
            dgOrders.ItemsSource = order.ToList();
            var serviceRender = from i in db.Оказанные_услуги
                                select i;
            dgServRend.ItemsSource = serviceRender.ToList();
            var staff = from i in db.Сотрудники
                        select i;
            dgStaff.ItemsSource = staff.ToList();
            var sumClient = from i in db.Сумма_заказов_месяц
                            select i;
            dgReport.ItemsSource = sumClient.ToList();

        }

        //Событие на нажатие кнопки, при котором вызывается метод экспорта для выбранной таблицы в Excel
        private void Export_Click(object sender, RoutedEventArgs e) 
        {
            if (cbTable.Text == "Клиенты") //условие сравнения текста в элементе ComboBox со строкой
                ReportExcel(dgClients); //вызов метода экспорта данных в Excel с передачей DataGrid экземпляра, который удовлетворяет условие
            else if (cbTable.Text == "Заказы")
                ReportExcel(dgOrders);
            else if (cbTable.Text == "Оказанные услуги")
                ReportExcel(dgServRend);
            else if (cbTable.Text == "Отчет")
                ReportExcel(dgReport);
            else
                MessageBox.Show("Вы не выбрали таблицу"); //открывается окно сообщения при неудовлетворении всех условий
        }
        //Метод экспорта таблицы в Excel
        private void ReportExcel(DataGrid dataGrid) //метод принимает в качестве аргумента экземпляр класса DataGrid
        {
            try //блок который будет обрабатывать исключения
            {
                Excel.Application excel = new Excel.Application(); //создаем объект класса Application и запускаем Excel
                Excel.Workbook workbook = excel.Workbooks.Add(); //создание пустого шаблона книги
                //Создаем объект класса Worksheet для работы с содержимым страницы в ранее созданой книге
                Excel.Worksheet sheet1 = (Excel.Worksheet)workbook.Sheets[1]; 
                sheet1.Name = "Отчет"; //Задаем странице новое имя
                for (int j = 0; j < dataGrid.Columns.Count; j++) //цикл для заполнения заголовков экспортируемой таблицы
                {
                    sheet1.Cells[1, j + 1].Font.Bold = true; //устанавливаем жирность для ячейки
                    sheet1.Columns[j + 1].ColumnWidth = 15; //устанавливаем ширину колонок
                    sheet1.Cells[1, j + 1].Value2 = dataGrid.Columns[j].Header; //копируем заголовок 
                }
                //циклы для заполнения Excel таблицы данными из таблицы передоваемой в данный метод в качестве аргумента
                for (int i = 0; i < dataGrid.Columns.Count; i++) //цикл проходит по столбцам
                {
                    for (int j = 0; j < dataGrid.Items.Count; j++) //цикл проходит по строкам
                    {
                        //создаем объект класса TextBlock для хранения строки
                        TextBlock b = dataGrid.Columns[i].GetCellContent(dataGrid.Items[j]) as TextBlock; 
                        sheet1.Cells[j + 2, i + 1] = b.Text; //записываем в ячейку строку из ячейки передоваемого dataGrid аргумента
                    }
                }
                excel.Visible = true; //Делаем объект видимым для отображения
                //Сохраняем книгу в выбранной дериктории с именем таблицы, которую выбрали для экспорта 
                workbook.SaveAs(@"C:\Отчет_" + cbTable.Text + ".xlsx"); 
            }
            catch //блок, который указывает, что будет исполнено в случае обработки исключения
            {
                MessageBox.Show("Ошибка экспорта","Ошибка"); //открывается окно сообщения при обработке исключения
            }
        }
    }
}
