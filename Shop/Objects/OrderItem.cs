﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IIS.Shop
{
    using System;
    using System.Xml;
    using ICSSoft.STORMNET.Business;
    using ICSSoft.STORMNET;
    
    
    // *** Start programmer edit section *** (Using statements)
    using ICSSoft.STORMNET.Business;
    // *** End programmer edit section *** (Using statements)


    /// <summary>
    /// Order item.
    /// </summary>
    // *** Start programmer edit section *** (OrderItem CustomAttributes)

    // *** End programmer edit section *** (OrderItem CustomAttributes)
    [BusinessServer("IIS.Shop.OrderItemBS, Shop.BusinessServers", ICSSoft.STORMNET.Business.DataServiceObjectEvents.OnAllEvents)]
    [AutoAltered()]
    [Caption("СтрокаЗаказа")]
    [AccessType(ICSSoft.STORMNET.AccessType.none)]
    [View("OrderItemE", new string[] {
            "Product as \'Товар\'",
            "Product.Name as \'\'",
            "Amount as \'Количество\'",
            "PriceWTaxes as \'Цена с налогом\'",
            "TotalSum as \'Сумма по позиции\'",
            "Product.ProductCode as \'\'",
            "Product.Weight as \'\'"}, Hidden=new string[] {
            "Product.Name",
            "Product.ProductCode",
            "Product.Weight"})]
    [MasterViewDefineAttribute("OrderItemE", "Product", ICSSoft.STORMNET.LookupTypeEnum.Standard, "", "Name")]
    [View("OrderItemInOrderL", new string[] {
            "Amount as \'\'",
            "PriceWTaxes as \'\'"}, Hidden=new string[] {
            "Amount",
            "PriceWTaxes"})]
    public class OrderItem : ICSSoft.STORMNET.DataObject
    {
        
        private int fAmount;
        
        private double fPriceWTaxes;
        
        private IIS.Shop.Product fProduct;
        
        private IIS.Shop.Order fOrder;
        
        // *** Start programmer edit section *** (OrderItem CustomMembers)

        // *** End programmer edit section *** (OrderItem CustomMembers)

        
        /// <summary>
        /// Amount.
        /// </summary>
        // *** Start programmer edit section *** (OrderItem.Amount CustomAttributes)

        // *** End programmer edit section *** (OrderItem.Amount CustomAttributes)
        public virtual int Amount
        {
            get
            {
                // *** Start programmer edit section *** (OrderItem.Amount Get start)

                // *** End programmer edit section *** (OrderItem.Amount Get start)
                int result = this.fAmount;
                // *** Start programmer edit section *** (OrderItem.Amount Get end)

                // *** End programmer edit section *** (OrderItem.Amount Get end)
                return result;
            }
            set
            {
                // *** Start programmer edit section *** (OrderItem.Amount Set start)

                // *** End programmer edit section *** (OrderItem.Amount Set start)
                this.fAmount = value;
                // *** Start programmer edit section *** (OrderItem.Amount Set end)

                // *** End programmer edit section *** (OrderItem.Amount Set end)
            }
        }
        
        /// <summary>
        /// PriceWTaxes.
        /// </summary>
        // *** Start programmer edit section *** (OrderItem.PriceWTaxes CustomAttributes)

        // *** End programmer edit section *** (OrderItem.PriceWTaxes CustomAttributes)
        public virtual double PriceWTaxes
        {
            get
            {
                // *** Start programmer edit section *** (OrderItem.PriceWTaxes Get start)

                // *** End programmer edit section *** (OrderItem.PriceWTaxes Get start)
                double result = this.fPriceWTaxes;
                // *** Start programmer edit section *** (OrderItem.PriceWTaxes Get end)

                // *** End programmer edit section *** (OrderItem.PriceWTaxes Get end)
                return result;
            }
            set
            {
                // *** Start programmer edit section *** (OrderItem.PriceWTaxes Set start)

                // *** End programmer edit section *** (OrderItem.PriceWTaxes Set start)
                this.fPriceWTaxes = value;
                // *** Start programmer edit section *** (OrderItem.PriceWTaxes Set end)

                // *** End programmer edit section *** (OrderItem.PriceWTaxes Set end)
            }
        }
        
        /// <summary>
        /// TotalSum.
        /// </summary>
        // *** Start programmer edit section *** (OrderItem.TotalSum CustomAttributes)

        // *** End programmer edit section *** (OrderItem.TotalSum CustomAttributes)
        [ICSSoft.STORMNET.NotStored()]
        [DataServiceExpression(typeof(SQLDataService), "SELECT SUM(PriceWTaxes * Amount) FROM OrderItem WHERE OrderItem.Order_m0 = STORMM" +
            "ainObjectKey")]
        public virtual double TotalSum
        {
            get
            {
                // *** Start programmer edit section *** (OrderItem.TotalSum Get)
                return 0;
                // *** End programmer edit section *** (OrderItem.TotalSum Get)
            }
            set
            {
                // *** Start programmer edit section *** (OrderItem.TotalSum Set)

                // *** End programmer edit section *** (OrderItem.TotalSum Set)
            }
        }
        
        /// <summary>
        /// Order item.
        /// </summary>
        // *** Start programmer edit section *** (OrderItem.Product CustomAttributes)

        // *** End programmer edit section *** (OrderItem.Product CustomAttributes)
        public virtual IIS.Shop.Product Product
        {
            get
            {
                // *** Start programmer edit section *** (OrderItem.Product Get start)

                // *** End programmer edit section *** (OrderItem.Product Get start)
                IIS.Shop.Product result = this.fProduct;
                // *** Start programmer edit section *** (OrderItem.Product Get end)

                // *** End programmer edit section *** (OrderItem.Product Get end)
                return result;
            }
            set
            {
                // *** Start programmer edit section *** (OrderItem.Product Set start)

                // *** End programmer edit section *** (OrderItem.Product Set start)
                this.fProduct = value;
                // *** Start programmer edit section *** (OrderItem.Product Set end)

                // *** End programmer edit section *** (OrderItem.Product Set end)
            }
        }
        
        /// <summary>
        /// мастеровая ссылка на шапку IIS.Shop.Order.
        /// </summary>
        // *** Start programmer edit section *** (OrderItem.Order CustomAttributes)

        // *** End programmer edit section *** (OrderItem.Order CustomAttributes)
        [Agregator()]
        [NotNull()]
        public virtual IIS.Shop.Order Order
        {
            get
            {
                // *** Start programmer edit section *** (OrderItem.Order Get start)

                // *** End programmer edit section *** (OrderItem.Order Get start)
                IIS.Shop.Order result = this.fOrder;
                // *** Start programmer edit section *** (OrderItem.Order Get end)

                // *** End programmer edit section *** (OrderItem.Order Get end)
                return result;
            }
            set
            {
                // *** Start programmer edit section *** (OrderItem.Order Set start)

                // *** End programmer edit section *** (OrderItem.Order Set start)
                this.fOrder = value;
                // *** Start programmer edit section *** (OrderItem.Order Set end)

                // *** End programmer edit section *** (OrderItem.Order Set end)
            }
        }
        
        /// <summary>
        /// Class views container.
        /// </summary>
        public class Views
        {
            
            /// <summary>
            /// "OrderItemE" view.
            /// </summary>
            public static ICSSoft.STORMNET.View OrderItemE
            {
                get
                {
                    return ICSSoft.STORMNET.Information.GetView("OrderItemE", typeof(IIS.Shop.OrderItem));
                }
            }
            
            /// <summary>
            /// "OrderItemInOrderL" view.
            /// </summary>
            public static ICSSoft.STORMNET.View OrderItemInOrderL
            {
                get
                {
                    return ICSSoft.STORMNET.Information.GetView("OrderItemInOrderL", typeof(IIS.Shop.OrderItem));
                }
            }
        }
    }
    
    /// <summary>
    /// Detail array of OrderItem.
    /// </summary>
    // *** Start programmer edit section *** (DetailArrayDetailArrayOfOrderItem CustomAttributes)

    // *** End programmer edit section *** (DetailArrayDetailArrayOfOrderItem CustomAttributes)
    public class DetailArrayOfOrderItem : ICSSoft.STORMNET.DetailArray
    {
        
        // *** Start programmer edit section *** (IIS.Shop.DetailArrayOfOrderItem members)

        // *** End programmer edit section *** (IIS.Shop.DetailArrayOfOrderItem members)

        
        /// <summary>
        /// Construct detail array.
        /// </summary>
        /// <summary>
        /// Returns object with type OrderItem by index.
        /// </summary>
        /// <summary>
        /// Adds object with type OrderItem.
        /// </summary>
        public DetailArrayOfOrderItem(IIS.Shop.Order fOrder) : 
                base(typeof(OrderItem), ((ICSSoft.STORMNET.DataObject)(fOrder)))
        {
        }
        
        public IIS.Shop.OrderItem this[int index]
        {
            get
            {
                return ((IIS.Shop.OrderItem)(this.ItemByIndex(index)));
            }
        }
        
        public virtual void Add(IIS.Shop.OrderItem dataobject)
        {
            this.AddObject(((ICSSoft.STORMNET.DataObject)(dataobject)));
        }
    }
}
