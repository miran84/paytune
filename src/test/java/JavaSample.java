
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.Objects;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


/**
 * Simple java API request sample.
 * 
 * - Version: 1.0.0
 * - Email: pgmodule@ksnet.co.kr
 * - Last Modifided: 2021.05.07
 */
public class JavaSample {
    /**
     * Loging method for sample.
     * @param o Parameter that want to log
     */
    private static void log(Object o) {
        System.out.println("[" + LocalDateTime.now().toString() + "] - " + o == null ? "null" : o.toString());
    }

    /**
     * Handle HTTP API Reqeust and response.
     * @param apiUrl Target API URL
     * @param apiKey API Authorization key
     * @papram reqJsonStr JSON format request body string
     * @return API Response body string. (JSON format)
     * @throws Exception Data paring failed, Coneection failed, Response failed, etc...
     */
    public static String apiRequest(String apiUrl, String apiKey, String reqJsonStr) throws Exception {
        Objects.requireNonNull(apiUrl);
        Objects.requireNonNull(apiKey);
        Objects.requireNonNull(reqJsonStr);

        StringBuilder responseBodySb = new StringBuilder(1024);
        
        try {
            // 1. Convert request data
            byte[] requestBodyData = reqJsonStr.getBytes(StandardCharsets.UTF_8);

            // 1. HTTP Connection and send request
            URL url = new URL(apiUrl);
            URLConnection urlConnection = (HttpURLConnection) url.openConnection();
            
            if (urlConnection == null) {
                throw new IOException("HTTP Open conneciton failed.");
            }

            urlConnection.setRequestProperty("Authorization", apiKey);
            urlConnection.addRequestProperty("Content-Type", "application/json");
            urlConnection.setConnectTimeout(5000);
            urlConnection.setDoInput(true);
            urlConnection.setDoOutput(true);

            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(urlConnection.getOutputStream());
            bufferedOutputStream.write(requestBodyData);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();

            // 3. Handle response
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            String readLine = null;
            
            while ((readLine = bufferedReader.readLine()) != null) {
                responseBodySb.append(readLine);
            }

            bufferedOutputStream.close();
        }
        catch (Exception e) {
            throw e;
        }

        return responseBodySb.toString();
    }

    // ################ Data Area Begin ################

    private static final String API_URL = "https://pay.ksnet.co.kr/kspay/webfep/api/v1/card/pay/noncert";
    private static final String API_URL_CANCEL = "https://pay.ksnet.co.kr/kspay/webfep/api/v1/card/cancel";
    private static final String API_KEY = "d6IvblpH5tw+GLIlaMIA1A==";
    private static final String REQUEST_JSON_STR = "{}";

    // ################ Data Area End ################

    /**
     * Test main.
     * @param args No use
     */
    public static void main(String[] args) {
        try {
//            String responseStr = JavaSample.apiRequest(API_URL, API_KEY, REQUEST_JSON_STR);
//            log(responseStr);
            String jsonString =
            "{\r\n" + 
            "  \"aid\": \"API ?????? ?????????\",\r\n" + 
            "  \"code\": \"API ?????? ??????\",\r\n" + 
            "  \"message\": \"API ?????? ?????????\",\r\n" + 
            "  \"data\": {\r\n" + 
            "    \"tid\": \"PG????????????\",\r\n" + 
            "    \"tradeDateTime\": \"????????????(yyyyMMddHHmmss)\",\r\n" + 
            "    \"totalAmount\": \"?????????\",\r\n" + 
            "    \"respCode\": \"????????????\",\r\n" + 
            "    \"respMessage\": \"???????????????\",\r\n" + 
            "    \"payload\": \"??????????????????\",\r\n" + 
            "    \"issuerCardType\": \"???????????????\",\r\n" + 
            "    \"issuerCardName\": \"????????????\",\r\n" + 
            "    \"purchaseCardType\": \"???????????????\",\r\n" + 
            "    \"purchaseCardName\": \"????????????\",\r\n" + 
            "    \"approvalNumb\": \"????????????\",\r\n" + 
            "    \"cardNumb\": \"????????????\",\r\n" + 
            "    \"expiryDate\": \"????????????\",\r\n" + 
            "    \"installMonth\": \"???????????????\",\r\n" + 
            "    \"cardType\": \"????????????\",\r\n" + 
            "    \"partCancelYn\": \"????????????????????????\"\r\n" + 
            "  }\r\n" + 
            "}"    ;

            JSONParser parser = new JSONParser();
            Object obj = parser.parse( jsonString );
            JSONObject jsonObj = (JSONObject) obj;
    		JSONObject Object = (JSONObject) jsonObj.get("data");
            
            String aid = (String) jsonObj.get("aid");
            String code = (String) jsonObj.get("code");
            String message = (String) jsonObj.get("message");
            
            String tid = (String) Object.get("tid");
            String tradeDateTime = (String) Object.get("tradeDateTime");
            String totalAmount = (String) Object.get("totalAmount");
            String respCode = (String) Object.get("respCode");
            String respMessage = (String) Object.get("respMessage");
            String payload = (String) Object.get("payload");
            String issuerCardType = (String) Object.get("issuerCardType");
            String issuerCardName = (String) Object.get("issuerCardName");
            String purchaseCardType = (String) Object.get("purchaseCardType");
            String purchaseCardName = (String) Object.get("purchaseCardName");
            String approvalNumb = (String) Object.get("approvalNumb");
            String cardNumb = (String) Object.get("cardNumb");
            String expiryDate = (String) Object.get("expiryDate");
            String installMonth = (String) Object.get("installMonth");
            String cardType = (String) Object.get("cardType");
            String partCancelYn = (String) Object.get("partCancelYn");
            
            System.out.println("aid="+aid);
            System.out.println("code="+code);
            System.out.println("message="+message);
            
            System.out.println("tid="+tid);
            System.out.println("tradeDateTime="+tradeDateTime);
            System.out.println("totalAmount="+totalAmount);
            System.out.println("respCode="+respCode);
            System.out.println("respMessage="+respMessage);
            System.out.println("payload="+payload);
            System.out.println("issuerCardType="+issuerCardType);
            System.out.println("issuerCardName="+issuerCardName);
            System.out.println("purchaseCardType="+purchaseCardType);
            System.out.println("purchaseCardName="+purchaseCardName);
            System.out.println("approvalNumb="+approvalNumb);
            System.out.println("cardNumb="+cardNumb);
            System.out.println("expiryDate="+expiryDate);
            System.out.println("installMonth="+installMonth);
            System.out.println("cardType="+cardType);
            System.out.println("partCancelYn="+partCancelYn);
            
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
