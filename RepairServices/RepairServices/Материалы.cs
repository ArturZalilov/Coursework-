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
    
    public partial class Материалы
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Материалы()
        {
            this.Использованные_материалы = new HashSet<Использованные_материалы>();
        }
    
        public int Код_материала { get; set; }
        public decimal Цена { get; set; }
        public string Наименование { get; set; }
        public Nullable<int> Количество_в_остатке { get; set; }
        public string примечание { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Использованные_материалы> Использованные_материалы { get; set; }
    }
}
