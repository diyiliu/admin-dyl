import com.dyl.admin.support.util.JacksonUtil;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description: TestJson
 * Author: DIYILIU
 * Update: 2018-10-20 16:43
 */
public class TestJson {
    
    
    @Test
    public void test() throws Exception{
        
        String str = "[{\n" +
                "\"id\": 29,\n" +
                "\"children\": [{\n" +
                "\"id\": 102\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 33,\n" +
                "\"children\": [{\n" +
                "\"id\": 108\n" +
                "}, {\n" +
                "\"id\": 105\n" +
                "}, {\n" +
                "\"id\": 131\n" +
                "}, {\n" +
                "\"id\": 125\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 35,\n" +
                "\"children\": [{\n" +
                "\"id\": 115\n" +
                "}, {\n" +
                "\"id\": 135\n" +
                "}, {\n" +
                "\"id\": 123\n" +
                "}, {\n" +
                "\"id\": 126\n" +
                "}, {\n" +
                "\"id\": 124\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 38,\n" +
                "\"children\": [{\n" +
                "\"id\": 140\n" +
                "}, {\n" +
                "\"id\": 139\n" +
                "}, {\n" +
                "\"id\": 138\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 36,\n" +
                "\"children\": [{\n" +
                "\"id\": 120\n" +
                "}, {\n" +
                "\"id\": 117\n" +
                "}, {\n" +
                "\"id\": 116\n" +
                "}, {\n" +
                "\"id\": 134\n" +
                "}, {\n" +
                "\"id\": 130\n" +
                "}, {\n" +
                "\"id\": 132\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 4,\n" +
                "\"children\": [{\n" +
                "\"id\": 98\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 31,\n" +
                "\"children\": [{\n" +
                "\"id\": 113\n" +
                "}, {\n" +
                "\"id\": 110\n" +
                "}, {\n" +
                "\"id\": 112\n" +
                "}, {\n" +
                "\"id\": 109\n" +
                "}, {\n" +
                "\"id\": 127\n" +
                "}, {\n" +
                "\"id\": 129\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 37,\n" +
                "\"children\": [{\n" +
                "\"id\": 121\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 30,\n" +
                "\"children\": [{\n" +
                "\"id\": 103\n" +
                "}, {\n" +
                "\"id\": 104\n" +
                "}]\n" +
                "}, {\n" +
                "\"id\": 34,\n" +
                "\"children\": [{\n" +
                "\"id\": 137\n" +
                "}, {\n" +
                "\"id\": 101\n" +
                "}, {\n" +
                "\"id\": 114\n" +
                "}, {\n" +
                "\"id\": 118\n" +
                "}, {\n" +
                "\"id\": 119\n" +
                "}, {\n" +
                "\"id\": 122\n" +
                "}]\n" +
                "}]";


        List list = JacksonUtil.toList(str, HashMap.class);

        System.out.println(list.size());
    }
}
