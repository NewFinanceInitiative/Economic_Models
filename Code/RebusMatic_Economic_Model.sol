// SPDX-License-Identifier: MIT
//
// - RebusMatic: An economic acitivity model based on the application of the austrian neoclassical 
// consumer and producer theory.
//
// - Model Overview: 
//
//
//
// - Mathematics Summary: 
//
//
//
//
//
//

pragma solidity ^0.8.20;

contract RebusMatic {

    // ECONOMIC METRICS
    uint256 TOTAL_CONSUMERS = 0;
    uint256 TOTAL_PRODUCERS = 0;

    uint256 TOTAL_ECONOMIC_INPUT_SCORE = 0;
    uint256 TOTAL_ECONOMIC_OUTPUT_SCORE = 0;

    uint256 OVERALL_UTILITY_POINTS = 0;
    uint256 OVERALL_PROFIT_POINTS = 0;

    // CONSUMER METRICS
    uint256 AVERAGE_UTILITY = 0;
    uint256 CONSUMER_SURPLUS = 0;
    uint256 DEMAND_ELASTICITY = 0;

    // PRODUCER METRICS
    uint256 AVERAGE_PROFIT = 0;
    uint256 PRODUCER_SURPLUS = 0;
    uint256 SUPPLY_ELASTICITY = 0;

    // MARKET METRICS
    uint256 MARKET_EFFICIENCY_SCORE = 0;
    uint256 PRICE_DISPERSION_SCORE = 0;
    uint256 C0NSUMER_PRODUCER_SCORE = 0;

    // CONSUMER DATA STRUCTURES
    struct CONSUMER {
        address WALLET_PUBLIC_KEY;
        uint256 UTILITY_SCORE;
        uint256 CONSUMER_NUMBER;
    }

    CONSUMER[] _consumers;

    // PRODUCER DATA STRUCTURES
    struct PRODUCER {
        address PRODUCTION_KEY;
        uint256 PROFIT_SCORE;
        uint256 PRODUCER_NUMBER;
    }

    PRODUCER[] _producers;

    constructor () {

    }
    
    // Economic Metrics
    function getTotalConsumers() public view returns (uint256) {
    return TOTAL_CONSUMERS;
    }
    
    function getTotalProducers() public view returns (uint256) {
        return TOTAL_PRODUCERS;
    }

    function increaseEconomicInputScore(uint256 _increase) public returns (uint256) {
        TOTAL_ECONOMIC_INPUT_SCORE = TOTAL_ECONOMIC_INPUT_SCORE + _increase;
        return (TOTAL_ECONOMIC_INPUT_SCORE);
    }

    function decreaseEconomicInputScore(uint256 _decrease) public returns (uint256) {
        TOTAL_ECONOMIC_INPUT_SCORE = TOTAL_ECONOMIC_INPUT_SCORE - _decrease;
        return (TOTAL_ECONOMIC_INPUT_SCORE);
    }

    function updateEconomicInputScore(uint256 _newScore) public returns (bool) {
        TOTAL_ECONOMIC_INPUT_SCORE = _newScore;
        return true;
    }

    function getEconomicInputScore() public view returns (uint256) {
        return (TOTAL_ECONOMIC_INPUT_SCORE);
    }

    function increaseEconomicOutputScore(uint256 _increase) public returns (uint256) {
        TOTAL_ECONOMIC_OUTPUT_SCORE = TOTAL_ECONOMIC_OUTPUT_SCORE + _increase;
        return (TOTAL_ECONOMIC_OUTPUT_SCORE);
    }

    function decreaseEconomicOutputScore(uint256 _decrease) public returns (uint256) {
        TOTAL_ECONOMIC_OUTPUT_SCORE = TOTAL_ECONOMIC_OUTPUT_SCORE - _decrease;
        return (TOTAL_ECONOMIC_OUTPUT_SCORE);
    }

    function updateEconomicOutputScore(uint256 _newScore) public returns (bool) {
        TOTAL_ECONOMIC_OUTPUT_SCORE = _newScore;
        return true;
    }

    function getEconomicOutputScore() public view returns (uint256) {
        return (TOTAL_ECONOMIC_OUTPUT_SCORE);
    }

    function addUtilityPoints(uint256 _increase) public returns (uint256) {
        OVERALL_UTILITY_POINTS += _increase;
        return (OVERALL_UTILITY_POINTS);
    }

    function removeUtilityPoints(uint256 _decrease) public returns (uint256) {
        OVERALL_UTILITY_POINTS -= _decrease;
        return (OVERALL_UTILITY_POINTS);
    }

    function updateUtilityPoints(uint256 _newPoints) public returns (bool) {
        OVERALL_UTILITY_POINTS = _newPoints;
        return true;
    }

    function getUtilityPoints() public view returns (uint256) {
        return (OVERALL_UTILITY_POINTS);
    }

    function addProfitPoint(uint256 _increase) public returns (uint256) {
        OVERALL_PROFIT_POINTS += _increase;
        return (OVERALL_PROFIT_POINTS);
    }

    function removeProfitPoint(uint256 _decrease) public returns (uint256) {
        OVERALL_PROFIT_POINTS -= _decrease;
        return (OVERALL_PROFIT_POINTS);
    }

    function updateProfitPoints(uint256 _newPoints) public returns (bool) {
        OVERALL_PROFIT_POINTS = _newPoints;
        return true;
    }

    function getProfitPoints() public view returns (uint256) {
        return (OVERALL_PROFIT_POINTS);
    }

    // Consumer Metrics
    function getAverageUtility() public view returns (uint256) {
        return AVERAGE_UTILITY;
    }

    function addConsumer () public returns (bool success) {
        CONSUMER memory _consumer = CONSUMER(msg.sender, 0, TOTAL_CONSUMERS + 1);
        _consumers.push(_consumer);
        TOTAL_CONSUMERS += _consumers.length;
        return true;
    }

    function getConsumer (uint256 _number) public view returns (address, uint256, uint256) {
        CONSUMER storage consumer = _consumers[_number];
        return (consumer.WALLET_PUBLIC_KEY, consumer.UTILITY_SCORE, consumer.CONSUMER_NUMBER);
    }

    function increaseConsumerUtilityScore(uint256 _consumerNumber, uint256 _increase) public returns (bool success) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        _consumers[_consumerNumber].UTILITY_SCORE += _increase;
        return true;
    }

    function decreaseConsumerUtilityScore(uint256 _consumerNumber, uint256 _decrease) public returns (bool success) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        _consumers[_consumerNumber].UTILITY_SCORE += _decrease;
        return true;
    }

    function updateConsumerUtilityScore(uint256 _consumerNumber, uint256 _newScore) public returns (bool) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        _consumers[_consumerNumber].UTILITY_SCORE = _newScore;
        return true;
    }

    function getConsumerUtilityScore(uint256 _consumerNumber) public view returns (uint256) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        return (_consumers[_consumerNumber].UTILITY_SCORE);
    }

    function increaseConsumerSurplus(uint256 _consumerNumber, uint256 _increase) public returns (bool success, uint256 _consumer, uint256 _surplus) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        CONSUMER_SURPLUS = CONSUMER_SURPLUS + _increase;
        return (true, _consumerNumber, CONSUMER_SURPLUS);
    }
    function decreaseConsumerSurplus(uint256 _consumerNumber, uint256 _decrease) public returns (bool success, uint256 _consumer, uint256 _surplus) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        CONSUMER_SURPLUS = CONSUMER_SURPLUS - _decrease;
        return (true, _consumerNumber, CONSUMER_SURPLUS);
    }

    function updateConsumerSurplusScore(uint256 _consumerNumber, uint256 _newScore) public returns (bool) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        CONSUMER_SURPLUS = _newScore;
        return true;
    } 

    function getConsumerSurplusScore() public view returns (uint256) {
        return CONSUMER_SURPLUS;
    }

    function increaseConsumerDemandElasticity(uint256 _consumerNumber, uint256 _increase) public returns (bool success, uint256 _consumer, uint256 _elasticity) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        DEMAND_ELASTICITY = DEMAND_ELASTICITY + _increase;
        return (true, _consumerNumber, DEMAND_ELASTICITY);
    }

    function decreaseConsumerDemandElasticity(uint256 _consumerNumber, uint256 _decrease) public returns (bool success, uint256 _consumer, uint256 _elasticity) {
        require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        DEMAND_ELASTICITY = DEMAND_ELASTICITY - _decrease;
        return (true, _consumerNumber, DEMAND_ELASTICITY);
    }

    function updateConsumerDemandElasticityScore(uint256 _consumerNumber, uint256 _newScore) public returns (bool) {
         require(_consumerNumber <= _consumers.length, "Invalid consumer number");
        DEMAND_ELASTICITY = _newScore;
        return true;
    }

    function getConsumerDemandElasticityScore() public view returns (uint256) {
        return DEMAND_ELASTICITY;
    }

    // Producer Metrics
    function getAverageProfit() public view returns (uint256) {
        return AVERAGE_PROFIT;
    }

    function addProducer() public returns (bool success) {
        PRODUCER memory _producer = PRODUCER(msg.sender, 0, TOTAL_PRODUCERS + 1);
        _producers.push(_producer);
        TOTAL_PRODUCERS += _producers.length;
        return true;
    }

    function getProducer(uint256 _number) public view returns (address, uint256, uint256) {
        require (_number <= _producers.length, "Invaild producer number");
        PRODUCER storage producer = _producers[_number];
        return (producer.PRODUCTION_KEY, producer.PROFIT_SCORE, producer.PRODUCER_NUMBER);
    }

    function increaseProducerProfitScore(uint256 _producerNumber, uint256 _increase) public returns (bool success) {
        require(_producerNumber <= _producers.length, "Invaild producer number");
        _producers[_producerNumber].PROFIT_SCORE += _increase;
        return true;
    }

    function DecreaseProducerProfitScore(uint256 _producerNumber, uint256 _decrease) public returns (bool success) {
        require(_producerNumber <= _producers.length, "Invaild producer number");
        _producers[_producerNumber].PROFIT_SCORE += _decrease;
        return true;
    }

    function updateProducerProfitScore(uint256 _producerNumber, uint256 _newScore) public returns (bool) {
         require(_producerNumber <= _producers.length, "Invaild producer number");
         _producers[_producerNumber].PROFIT_SCORE = _newScore;
         return true;
    }

    function getProducerProfitScore(uint256 _producerNumber) public view returns (uint256) {
        require(_producerNumber <= _producers.length, "Invaild producer number");
        return (_producers[_producerNumber].PROFIT_SCORE);
    }

    function increaseProducerSurplus(uint256 _producerNumber, uint256 _increase) public returns (bool success, uint256 _producer, uint256 _surplus) {
        require(_producerNumber <= _producers.length, "Invalid producer number");
        PRODUCER_SURPLUS = PRODUCER_SURPLUS + _increase;
        return (true, _producerNumber, PRODUCER_SURPLUS);
    }
    function decreaseProducerSurplus(uint256 _producerNumber, uint256 _decrease) public returns (bool success, uint256 _producer, uint256 _surplus) {
        require(_producerNumber <= _producers.length, "Invalid producer number");
        PRODUCER_SURPLUS = PRODUCER_SURPLUS - _decrease;
        return (true, _producerNumber, PRODUCER_SURPLUS);
    }

    function updateProducerSurplusScore(uint256 _producerNumber, uint256 _newScore) public returns (bool) {
        require(_producerNumber <= _producers.length, "Invalid producer number");
        PRODUCER_SURPLUS = _newScore;
        return true;
    }

    function getProducerSurplusScore() public view returns (uint256) {
        return PRODUCER_SURPLUS;
    }

    function increaseProducerSupplyElasticity(uint256 _producerNumber, uint256 _increase) public returns (bool success, uint256 _producer, uint256 _elasticity) {
        require(_producerNumber <= _producers.length, "Invalid producer number");
        SUPPLY_ELASTICITY = SUPPLY_ELASTICITY + _increase;
        return (true, _producerNumber, SUPPLY_ELASTICITY);

    }

    function decreaseProducerSupplyElasticity(uint256 _producerNumber, uint256 _decrease) public returns (bool success, uint256 _producer, uint256 _elasticity) {
        require(_producerNumber <= _producers.length, "Invalid producer number");
        SUPPLY_ELASTICITY = SUPPLY_ELASTICITY - _decrease;
        return (true, _producerNumber, SUPPLY_ELASTICITY);
    }

    function updateProducerSupplyElasticityScore(uint256 _producerNumber, uint256 _newScore) public returns (bool) {
        require(_producerNumber <= _producers.length, "Invalid producer number");
        SUPPLY_ELASTICITY = _newScore;
        return true;
    }

    function getProducerSupplyElasticityScore() public view returns (uint256) {
        return SUPPLY_ELASTICITY;
    }

    // Market Metrics
    function increaseMarketEfficiencyScore(uint256 _increase) public returns (bool, uint256) {
        MARKET_EFFICIENCY_SCORE = MARKET_EFFICIENCY_SCORE + _increase;
        return (true, MARKET_EFFICIENCY_SCORE);
    }

    function decreaseMarketEfficiencyScore(uint256 _decrease) public returns (bool, uint256) {
        MARKET_EFFICIENCY_SCORE = MARKET_EFFICIENCY_SCORE - _decrease;
        return (true, MARKET_EFFICIENCY_SCORE);
    }

    function updateMarketEfficiencyScore(uint256 _newScore) public returns (bool) {
        MARKET_EFFICIENCY_SCORE = _newScore;
        return true;
    }

    function getMarketEfficiencyScore() public view returns (uint256) {
        return MARKET_EFFICIENCY_SCORE;
    }

    function increasePriceDispersionScore(uint256 _increase) public returns (bool, uint256) {
        PRICE_DISPERSION_SCORE = PRICE_DISPERSION_SCORE + _increase;
        return (true, PRICE_DISPERSION_SCORE);
    }

    function decreasePriceDispersionScore(uint256 _decrease) public returns (bool, uint256) {
        PRICE_DISPERSION_SCORE = PRICE_DISPERSION_SCORE - _decrease;
        return (true, PRICE_DISPERSION_SCORE);
    }

    function updatePriceDispersionScore(uint256 _newScore) public returns (bool) {
        PRICE_DISPERSION_SCORE = _newScore;
        return true;
    } 

    function getPriceDispersionScore() public view returns (uint256) {
        return PRICE_DISPERSION_SCORE;
    }

    function increaseConsumerProducerScore(uint256 _increase) public returns (bool, uint256) {
        C0NSUMER_PRODUCER_SCORE = C0NSUMER_PRODUCER_SCORE + _increase;
        return (true, C0NSUMER_PRODUCER_SCORE);
    }

    function decreaseConsumerProducerScore(uint256 _decrease) public returns (bool, uint256) {
        C0NSUMER_PRODUCER_SCORE = C0NSUMER_PRODUCER_SCORE - _decrease;
        return (true, C0NSUMER_PRODUCER_SCORE);
    }

    function updateConsumerProducerScore(uint256 _newScore) public returns (bool) {
        C0NSUMER_PRODUCER_SCORE = _newScore;
        return true;
    }

    function getConsumerProducerScore() public view returns (uint256) {
        return C0NSUMER_PRODUCER_SCORE;
    }

    // Economic Mathematics
    function EconomicInputScoreMeasurement() public {

    }

    function EconomicOutputScoreMeasurement() public {

    }

    function UtilityPointMeasurement() public {

    }

    function ProfitPointMeasurement() public {

    }

    // Consumer Mathematics
    function consumerUtilityScoreMeasurement() public {

    }

    function consumerSurplusScoreMeasurement() public {

    }

    function consumerElasticityScoreMeasurement() public {

    }

    // Producer Mathematics
    function producerProfitScoreMeasurement() public {

    }

    function producerSurplusScoreMeasurement() public {

    }

    function producerElasticityScoreMeasurement() public {

    }

    // Market Mathematics
    function priceEffieicencyScoreMeasurement() public {

    }

    function priceDispersionScoreMeasurement() public {

    }

    function consumerProducerScoreMeasurement() public {

    }

}
