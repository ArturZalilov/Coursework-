//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RepairServices
{
    using System;
    using System.Collections.Generic;
    
    public partial class Использованные_материалы
    {
        public int N_пп { get; set; }
        public int Код_м { get; set; }
        public int Номер_заказа { get; set; }
        public int Количество { get; set; }
    
        public virtual Заказы Заказы { get; set; }
        public virtual Материалы Материалы { get; set; }
    }
}
