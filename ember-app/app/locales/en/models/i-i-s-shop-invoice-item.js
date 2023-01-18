export default {
  projections: {
    InvoiceItemE: {
      product: {
        __caption__: 'product',
        name: {
          __caption__: 'name'
        }
      },
      amount: {
        __caption__: 'amount'
      },
      weight: {
        __caption__: 'weight'
      },
      price: {
        __caption__: 'price'
      },
      totalSum: {
        __caption__: 'totalSum'
      }
    }
  },
  validations: {
    amount: {
      __caption__: 'amount'
    },
    weight: {
      __caption__: 'weight'
    },
    price: {
      __caption__: 'price'
    },
    totalSum: {
      __caption__: 'totalSum'
    },
    product: {
      __caption__: 'product'
    },
    invoice: {
      __caption__: 'invoice'
    }
  }
};
