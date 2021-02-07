package com.yieldlab.step_definitions;

import com.yieldlab.utilities.BidUtils;
import com.yieldlab.utilities.ConfigurationReader;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.junit.Assert;

import java.util.HashMap;
import java.util.Map;

import static com.yieldlab.utilities.BidUtils.*;


public class BidderStepDefinitions {

    String baseUrlA = ConfigurationReader.get("baseUrlA");
    String baseUrlB = ConfigurationReader.get("baseUrlB");
    String baseUrlC = ConfigurationReader.get("baseUrlC");
    String baseUrlAuction = ConfigurationReader.get("baseUrlAuction");

    Response response;

    Map<String,Object> requestBody;

    BidUtils bidUtils = new BidUtils();

    String str = "";

    @Given("User creates a json body using {string} {string} {string} {string}")
    public void user_creates_a_json_body_using(String id, String a, String b, String c) {
        Map<String,String> innerMap = new HashMap<>();
        innerMap.put("a",a);
        innerMap.put("b",b);
        innerMap.put("c",c);

        requestBody = new HashMap<>();
        requestBody.put("id",id);
        requestBody.put("attributes",innerMap);
    }

    @When("User sends POST request to Bidder Port A")
    public void user_sends_post_request_to_bidder_port_a() {
        response = RestAssured.given().contentType(ContentType.JSON)
                .and().body(requestBody)
                .when().post(baseUrlA);
    }

    @When("User sends POST request to Bidder Port B")
    public void user_sends_post_request_to_bidder_port_b() {
        response = RestAssured.given().contentType(ContentType.JSON)
                .and().body(requestBody)
                .when().post(baseUrlB);
    }

    @When("User sends POST request to Bidder Port C")
    public void user_sends_post_request_to_bidder_port_c() {
        response = RestAssured.given().contentType(ContentType.JSON)
                .and().body(requestBody)
                .when().post(baseUrlC);
    }

    @Then("User gets status code as {int}")
    public void user_gets_status_code_as(Integer expectedCode) {
        Assert.assertEquals("Verify status code",(int)expectedCode,response.statusCode());
    }

    @And("Response body is as expected for A {string} {string} {string} {string}")
    public void responseBodyIsAsExpectedForA(String id, String a, String b, String c) {
        Assert.assertEquals("Verify id in response body",id,response.path("id"));
        Integer expectedBid = Integer.parseInt(a) * bidA;
        Assert.assertEquals("Verify bid in response body",expectedBid,response.path("bid"));
        Assert.assertEquals("Verify content value in response body","a:$price$",response.path("content"));
    }

    @And("Response body is as expected for B {string} {string} {string} {string}")
    public void responseBodyIsAsExpectedForB(String id, String a, String b, String c) {
        Assert.assertEquals("Verify id in response body",id,response.path("id"));
        Integer expectedBid = Integer.parseInt(b) * bidB;
        Assert.assertEquals("Verify bid in response body",expectedBid,response.path("bid"));
        Assert.assertEquals("Verify content value in response body","b:$price$",response.path("content"));
    }

    @And("Response body is as expected for C {string} {string} {string} {string}")
    public void responseBodyIsAsExpectedForC(String id, String a, String b, String c) {
        Assert.assertEquals("Verify id in response body",id,response.path("id"));
        Integer expectedBid = Integer.parseInt(c) * bidC;
        Assert.assertEquals("Verify bid value in response body",expectedBid,response.path("bid"));
        Assert.assertEquals("Verify content value in response body","c:$price$",response.path("content"));
    }

    @When("User sends GET request to {string} endpoint")
    public void user_sends_get_request_to_endpoint(String id) {
        response = RestAssured.when().get(baseUrlAuction + id);
    }

    @When("User sends GET request to {string} endpoint {string} {string}")
    public void userSendsGETRequestToEndpoint(String id, String key1, String value1) {
        response = RestAssured.given().queryParam(key1, value1)
                .when().get(baseUrlAuction + id);
    }

    @When("User sends GET request to {string} endpoint {string} {int} {string} {int}")
    public void userSendsGETRequestToEndpoint(String id, String key1, int value1, String key2, int value2) {
        response = RestAssured.given().queryParam(key1, value1).queryParam(key2,value2)
                .when().get(baseUrlAuction + id);
    }

    @When("User sends GET request to {string} endpoint {string} {int} {string} {int} for Random Test")
    public void user_sends_get_request_to_endpoint_for_random_test(String id, String key1, int value1, String key2, int value2) {

        for (int i = 0; i < 50; i++) {
            response = RestAssured.given().queryParam(key1, value1).queryParam(key2,value2)
                    .when().get(baseUrlAuction + id);
            str += response.asString().substring(0, 1);
        }

    }

    @When("User sends GET request to {string} endpoint {string} {int} {string} {int} {string} {int} for Random Test")
    public void user_sends_get_request_to_endpoint_for_random_test(String id, String key1, int value1, String key2, int value2, String key3, int value3) {
        for (int i = 0; i < 50; i++) {
            response = RestAssured.given().queryParam(key1, value1).queryParam(key2,value2).queryParam(key3,value3)
                    .when().get(baseUrlAuction + id);
            str += response.asString().substring(0, 1);
        }

    }

    @When("User sends GET request to {string} endpoint {string} {int} {string} {int} {string} {int}")
    public void userSendsGETRequestToEndpoint(String id, String key1, int value1, String key2, int value2, String key3, int value3) {
        response = RestAssured.given().queryParam(key1, value1).queryParam(key2,value2).queryParam(key3,value3)
                .when().get(baseUrlAuction + id);
    }

    @Then("Response body returns winner bid {string} {int} {string} {int} {string} {int}")
    public void response_body_returns_winner_bid(String key1, int value1, String key2, int value2, String key3, int value3) {
        int actualWinnerBid = Integer.parseInt(response.asString().substring(2));
        int expectedWinnerBid = bidUtils.getWinner(key1, value1, key2, value2, key3, value3);
        Assert.assertEquals("Verify winner bid is the highest bid",expectedWinnerBid,actualWinnerBid);
    }

    @And("Response body returns winner bid {string} {int} {string} {int}")
    public void responseBodyReturnsWinnerBidValueValue(String key1, int value1, String key2, int value2) {
        int actualWinnerBid = Integer.parseInt(response.asString().substring(2));
        int expectedWinnerBid = bidUtils.getWinner(key1, value1, key2, value2);
        Assert.assertEquals("Verify winner bid is the highest bid",expectedWinnerBid,actualWinnerBid);
    }

    @And("Response body returns winner bid {string} {int}")
    public void responseBodyReturnsWinnerBidValue(String key1, int value1) {
        int actualWinnerBid = Integer.parseInt(response.asString().substring(2));
        int expectedWinnerBid = bidUtils.getWinner(key1, value1);
        Assert.assertEquals("Verify winner bid is the highest bid",expectedWinnerBid,actualWinnerBid);
    }

    @And("Response body returns winner bid")
    public void responseBodyReturnsWinnerBid() {
        int actualWinnerBid = Integer.parseInt(response.asString().substring(2));
        int expectedWinnerBid = bidUtils.findMaxBid(bidA,bidB,bidC);
        Assert.assertEquals("Verify winner bid is the highest bid",expectedWinnerBid,actualWinnerBid);
    }

    @And("Response body returns winner bidder as {string} or {string} or {string}")
    public void responseBodyReturnsWinnerBidderAsOrOr(String key1, String key2, String key3) {
        String actualWinnerBidder = response.asString().substring(0, 1);
        Assert.assertTrue("Verify that winner is " + key1 + " or " + key2 + " or " + key3,actualWinnerBidder.equals(key1) || actualWinnerBidder.equals(key2) || actualWinnerBidder.equals(key3));
    }

    @And("Response body returns winner bidder as {string} or {string}")
    public void responseBodyReturnsWinnerBidderAsOr(String key1, String key2) {
        String actualWinnerBidder = response.asString().substring(0, 1);
        Assert.assertTrue("Verify that winner is " + key1 + " or " + key2,actualWinnerBidder.equals(key1) || actualWinnerBidder.equals(key2));
    }

    @And("Response body should return winner bidder randomly  as {string} or {string}")
    public void responseBodyShouldReturnWinnerBidderRandomlyAsOr(String key1, String key2) {
        System.out.println("str = " + str);
        Assert.assertTrue("Verify that bidder is chosen randomly as " + key1 + " or " + key2,str.contains(key1) && str.contains(key2));
    }

    @And("Response body should return winner bidder randomly as {string} or {string} or {string}")
    public void responseBodyShouldReturnWinnerBidderRandomlyAsOrOr(String key1, String key2, String key3) {
        System.out.println("str = " + str);
        Assert.assertTrue("Verify that bidder is chosen randomly as " + key1 + " or " + key2 + " or " + key3,str.contains(key1) && str.contains(key2) && str.contains(key3));
    }

    @Then("Response body contains {string}")
    public void response_body_contains(String message) {
        Assert.assertTrue("Verify that response body contains 'No valid bids' message",response.asString().contains(message));
    }
}
