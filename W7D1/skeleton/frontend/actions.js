

const selectCurrency = (baseCurrency, rates) => {
  return ({
    type: "SWITCH CURRENCY",
    baseCurrency,
    rates
  });
};

export default selectCurrency;
