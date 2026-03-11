// SPDX-License-Identifier: MIT

// Contract RebusMatic_V0.1 is an economic acitivity model based on the application of the consumer and producer theory  
// that is going to be applied for the decentralised finance (DeFi) markets on all EVM public blockchains that are  
// functional with the process of implementing financial activity. RebusMatic_V0.1 is aimed to be supportive
// of modelling economic acitivty in the decentralised finance (DeFi) markets by applying the consumer
// and producer theory to help apply metrics that can be executed for the purposes of analysising economic activity
// that creates the market for decentralised finance (DeFi). RebusMatic_V0.1 is based on the metrics that can be 
// applied to decentralised finance (DeFi) activity for accountability to be given for the instance of transactions and 
// the execution of smart contract functions that determines utility and profits for both consumers and producers.

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

    function addConsumer () public returns (bool success) {
        TOTAL_CONSUMERS += _consumers.length;
        CONSUMER memory _consumer = CONSUMER(msg.sender, 0, TOTAL_CONSUMERS);
        _consumers.push(_consumer);
        return true;
    }

    function increaseConsumerUtilityScore (uint256 _consumerNumber, uint256 _increase) public returns (bool success) {
        require(_consumerNumber < _consumers.length, "Invalid consumer number");
        _consumers[_consumerNumber].UTILITY_SCORE += _increase;
        return true;
    }

    function getConsumer (uint256 _number) public view returns (address, uint256, uint256) {
        CONSUMER storage consumer = _consumers[_number];
        return (consumer.WALLET_PUBLIC_KEY, consumer.UTILITY_SCORE, consumer.CONSUMER_NUMBER);
    }

    function getProducer(uint256 _number) public view returns (address, uint256, uint256) {
        require (_number <= _producers.length, "Invaild producer number");
        PRODUCER storage producer = _producers[_number];
        return (producer.PRODUCTION_KEY, producer.PROFIT_SCORE, producer.PRODUCER_NUMBER);
    }

    function addProducer() public returns (bool success) {
        TOTAL_PRODUCERS += _producers.length;
        PRODUCER memory _producer = PRODUCER(msg.sender, 0, TOTAL_PRODUCERS);
        _producers.push(_producer);
        return true;
    }

    function getEconomicInputScore() public view returns (uint256) {
        return (TOTAL_ECONOMIC_INPUT_SCORE);
    }

    function increaseEconomicInputScore(uint256 _increase) public view returns (uint256) {
        return (TOTAL_ECONOMIC_INPUT_SCORE);
    }

    function decreaseEconomicInputScore(uint256 _decrease) public view returns (uint256) {
        return (TOTAL_ECONOMIC_INPUT_SCORE);
    }

    function getEconomicOutputScore() public view returns (uint256) {
        return (TOTAL_ECONOMIC_OUTPUT_SCORE);
    }

    function increaseEconomicOutputScore(uint256 _increase) public view returns (uint256) {
        return (TOTAL_ECONOMIC_OUTPUT_SCORE);
    }

    function decreaseEconomicOutputScore(uint256 _decrease) public view returns (uint256) {
        return (TOTAL_ECONOMIC_OUTPUT_SCORE);
    }

    function getUtilityPoints() public view returns (uint256) {
        return (OVERALL_UTILITY_POINTS);
    }

    function addUtilityPoint(uint256 _increase) public returns (uint256) {
        OVERALL_UTILITY_POINTS += _increase;
        return (OVERALL_UTILITY_POINTS);
    }

    function removeUtilityPoint(uint256 _decrease) public returns (uint256) {
        OVERALL_UTILITY_POINTS -= _decrease;
        return (OVERALL_UTILITY_POINTS);
    }

    function getProfitPoints() public view returns (uint256) {
        return (OVERALL_PROFIT_POINTS);
    }

    function addProfitPoint(uint256 _increase) public returns (uint256) {
        OVERALL_PROFIT_POINTS += _increase;
        return (OVERALL_PROFIT_POINTS);
    }

    function removeProfitPoint(uint256 _decrease) public returns (uint256) {
        OVERALL_PROFIT_POINTS -= _decrease;
        return (OVERALL_PROFIT_POINTS);
    }

    // Consumer Metric
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

    // Producer Metric
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

    // Market Metric

    // Math
    function EconomicInputScoreMeasurement() public {

    }

    function EconomicOutputScoreMeasurement() public {

    }

    function UtilityPointMeasurement() public {

    }

    function ProfitPointMeasurement() public {

    }

}