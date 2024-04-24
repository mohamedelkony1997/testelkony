import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ItemsDetailsController {
  final String apiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TkRRMk1qVXNJbTVoYldVaU9pSnBibWwwYVdGc0luMC5ibS15Z1ZRSHY5RGx6VEtyWXlVcmtNQURyYlNwbVF3b1pPT19RLVNqTHJtVS1VMC02eUlwdVlfOGNqLUYxbzdWN3NMaXg5MGE1Q1ZIQzk5akdlZ0ViZw==";
  String? token;
  String? id;
  String? refCodefinal;
  String? paymentKeyFinal;
  Future<String> authenticate() async {
    final String url = "https://accept.paymob.com/api/auth/tokens";

    final Map<String, String> requestBody = {"api_key": apiKey};

    final String jsonBody = json.encode(requestBody);

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = json.decode(response.body);

      token = responseBody["token"];

      return responseBody["token"];
    } else {
      // Authentication failed, handle the error
      throw Exception("Authentication failed: ${response.reasonPhrase}");
    }
  }

  Future<void> registerOrder(String price) async {
    final String apiUrl = "https://accept.paymob.com/api/ecommerce/orders";

    // Replace with your actual auth token
    final String authToken = await authenticate();
    print(authToken);
    final Map<String, dynamic> orderData = {
      "auth_token": authToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      
      "items": [],
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(orderData),
    );
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Order registered successfully
      print("Order registered successfully!");
      print("Response: ${response.body}");
      String orderid = responseBody['id'].toString();
      String totalpr = responseBody['amount_cents'].toString();
      final paymentKey =
          await fetchPaymentKey(orderid, totalpr); // Pass 'id' here
      if (paymentKey != null) {
        print('Payment Key: $paymentKey');
          setPaymentKey(paymentKey);
      }
      print(responseBody['id']);
    } else {
      // Failed to register order
      print("Failed to register order");
      print("Error: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  }

  Future<String?> fetchPaymentKey(String order_id, String totalprice) async {
    final url =
        Uri.parse('https://accept.paymob.com/api/acceptance/payment_keys');
    final String authToken = await authenticate();
    // Define the request body as a map
    final requestBody = {
      "auth_token": authToken,
      "amount_cents": totalprice,
      "expiration": 3600,
      "order_id": order_id,
      "billing_data": {
        "apartment": "NA",
        "email": "mohamedhamdyelkony97m@gmail.com",
        "floor": "NA",
        "first_name": "Flutter",
        "street": "NA",
        "building": "NA",
        "phone_number": "+201022930508",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "Cairo",
        "country": "EGY",
        "last_name": "developer",
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": 4212759,
      "lock_order_when_paid": "false"
    };

    final requestBodyJson = jsonEncode(requestBody);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBodyJson,
    );
    print('Response body: ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      final paymentKey = jsonResponse['token'];
    
      final refCode = await getRefCode(paymentKey); // Pass 'id' here
      if (refCode != null) {
        print('Payment Key: $refCode');
        setPaymentRefCode(refCode);
        print(refCodefinal);
      }
      return paymentKey;
    } else {
      // Handle the error here
      print('Failed to fetch payment key. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }

  Future<String?> getRefCode(String token) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // Add any other headers you need here
    };

    // Define the request body
    Map<String, dynamic> requestBody = {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": token,
    };

    // Encode the request body as JSON
    String requestBodyJson = json.encode(requestBody);

    // Define the API endpoint URL
    String apiUrl = 'https://accept.paymob.com/api/acceptance/payments/pay';

    try {
      // Make the GET request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: requestBodyJson,
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response JSON
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Extract the payment reference code from the response
        String paymentRefCode = responseData['id'].toString() ?? '';

        return paymentRefCode;
      } else {
        // If the request was not successful, print the error message
        print(
            'Failed to get payment reference code. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      print('Error while fetching payment reference code: $e');
      return null;
    }
  }

  void setPaymentRefCode(String refCode) {
    this.refCodefinal = refCode;
  }
  void setPaymentKey(String paymentKey) {
    this.paymentKeyFinal = paymentKey;
  }
}
