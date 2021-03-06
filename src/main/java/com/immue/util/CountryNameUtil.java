package com.immue.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by jian.wu on 8/1/18.
 */
public class CountryNameUtil {

    private static Map<String, String> map = new HashMap<>();

    static {
        map.put("阿富汗", "Afghanistan");
        map.put("奥兰群岛", "Aland Islands");
        map.put("阿尔巴尼亚", "Albania");
        map.put("阿尔及利亚", "Algeria");
        map.put("美属萨摩亚", "American Samoa");
        map.put("安道尔共和国", "Andorra");
        map.put("安哥拉", "Angola");
        map.put("安圭拉", "Anguilla");
        map.put("安提瓜和巴布达", "Antigua and Barbuda");
        map.put("阿根廷", "Argentina");
        map.put("亚美尼亚", "Armenia");
        map.put("阿鲁巴", "Aruba");
        map.put("澳大利亚", "Australia");
        map.put("奥地利", "Austria");
        map.put("阿塞拜疆", "Azerbaijan");
        map.put("孟加拉", "Bangladesh");
        map.put("巴林", "Bahrain");
        map.put("巴哈马", "Bahamas");
        map.put("巴巴多斯", "Barbados");
        map.put("白俄罗斯", "Belarus");
        map.put("比利时", "Belgium");
        map.put("伯利兹", "Belize");
        map.put("贝宁", "Benin");
        map.put("百慕大群岛", "Bermuda");
        map.put("不丹", "Bhutan");
        map.put("玻利维亚", "Bolivia");
        map.put("波斯尼亚和墨塞哥维那", "Bosnia and Herzegovina");
        map.put("博茨瓦纳", "Botswana");
        map.put("布维岛", "Bouvet Island");
        map.put("巴西", "Brazil");
        map.put("文莱", "Brunei");
        map.put("保加利亚", "Bulgaria");
        map.put("布基纳法索", "Burkina Faso");
        map.put("布隆迪", "Burundi");
        map.put("柬埔寨", "Cambodia");
        map.put("喀麦隆", "Cameroon");
        map.put("加拿大", "Canada");
        map.put("佛得角", "Cape Verde");
        map.put("中非共和国", "Central African Republic");
        map.put("乍得", "Chad");
        map.put("智利", "Chile");
        map.put("圣诞岛", "Christmas Islands");
        map.put("科科斯（基林）群岛", "Cocos (keeling) Islands");
        map.put("哥伦比亚", "Colombia");
        map.put("科摩罗", "Comoros");
        map.put("刚果民主共和国", "Congo (Congo-Kinshasa)");
        map.put("刚果共和国", "Congo");
        map.put("库克群岛", "Cook Islands");
        map.put("哥斯达黎加", "Costa Rica");
        map.put("科特迪瓦", "Cote D'Ivoire");
        map.put("中国", "China");
        map.put("克罗地亚", "Croatia");
        map.put("古巴", "Cuba");
        map.put("捷克", "Czech");
        map.put("塞浦路斯", "Cyprus");
        map.put("丹麦", "Denmark");
        map.put("吉布提", "Djibouti");
        map.put("多米尼加共和国", "Dominica");
        map.put("东帝汶", "East Timor");
        map.put("厄瓜多尔", "Ecuador");
        map.put("埃及", "Egypt");
        map.put("赤道几内亚", "Equatorial Guinea");
        map.put("厄立特里亚", "Eritrea");
        map.put("爱沙尼亚", "Estonia");
        map.put("埃塞俄比亚", "Ethiopia");
        map.put("法罗群岛", "Faroe Islands");
        map.put("斐济", "Fiji");
        map.put("芬兰", "Finland");
        map.put("法国", "France");
        map.put("法国大都会", "MetropolitanFrance");
        map.put("法属圭亚那", "French Guiana");
        map.put("法属波利尼西亚", "French Polynesia");
        map.put("加蓬", "Gabon");
        map.put("冈比亚", "Gambia");
        map.put("格鲁吉亚", "Georgia");
        map.put("德国", "Germany");
        map.put("加纳", "Ghana");
        map.put("直布罗陀", "Gibraltar");
        map.put("希腊", "Greece");
        map.put("格林纳达", "Grenada");
        map.put("瓜德罗普", "Guadeloupe");
        map.put("关岛", "Guam");
        map.put("危地马拉", "Guatemala");
        map.put("根西岛", "Guernsey");
        map.put("几内亚比绍", "Guinea-Bissau");
        map.put("几内亚", "Guinea");
        map.put("圭亚那", "Guyana");
        map.put("海地", "Haiti");
        map.put("洪都拉斯", "Honduras");
        map.put("匈牙利", "Hungary");
        map.put("冰岛", "Iceland");
        map.put("印度", "India");
        map.put("印度尼西亚", "Indonesia");
        map.put("伊朗", "Iran");
        map.put("伊拉克", "Iraq");
        map.put("爱尔兰", "Ireland");
        map.put("英属马恩岛", "Isle of Man");
        map.put("以色列", "Israel");
        map.put("意大利", "Italy");
        map.put("牙买加", "Jamaica");
        map.put("日本", "Japan");
        map.put("泽西岛", "Jersey");
        map.put("约旦", "Jordan");
        map.put("哈萨克斯坦", "Kazakhstan");
        map.put("肯尼亚", "Kenya");
        map.put("基里巴斯", "Kiribati");
        map.put("韩国", "Korea (South)");
        map.put("朝鲜", "Korea (North)");
        map.put("科威特", "Kuwait");
        map.put("吉尔吉斯斯坦", "Kyrgyzstan");
        map.put("老挝", "Laos");
        map.put("拉脱维亚", "Latvia");
        map.put("黎巴嫩", "Lebanon");
        map.put("莱索托", "Lesotho");
        map.put("利比里亚", "Liberia");
        map.put("利比亚", "Libya");
        map.put("列支敦士登", "Liechtenstein");
        map.put("立陶宛", "Lithuania");
        map.put("卢森堡", "Luxembourg");
        map.put("马其顿", "Macedonia");
        map.put("马拉维", "Malawi");
        map.put("马来西亚", "Malaysia");
        map.put("马达加斯加", "Madagascar");
        map.put("马尔代夫", "Maldives");
        map.put("马里", "Mali");
        map.put("马耳他", "Malta");
        map.put("马绍尔群岛", "Marshall Islands");
        map.put("马提尼克", "Martinique");
        map.put("毛里塔尼亚", "Mauritania");
        map.put("毛里求斯", "Mauritius");
        map.put("马约特", "Mayotte");
        map.put("墨西哥", "Mexico");
        map.put("密克罗尼西亚", "Micronesia");
        map.put("摩尔多瓦", "Moldova");
        map.put("摩纳哥", "Monaco");
        map.put("蒙古", "Mongolia");
        map.put("黑山", "Montenegro");
        map.put("蒙特塞拉特岛", "Montserrat");
        map.put("摩洛哥", "Morocco");
        map.put("莫桑比克", "Mozambique");
        map.put("缅甸", "Myanmar");
        map.put("纳米比亚", "Namibia");
        map.put("瑙鲁", "Nauru");
        map.put("尼泊尔", "Nepal");
        map.put("荷兰", "Netherlands");
        map.put("新喀里多尼亚群岛", "New Caledonia");
        map.put("新西兰", "New Zealand");
        map.put("尼加拉瓜", "Nicaragua");
        map.put("尼日尔", "Niger");
        map.put("尼日利亚", "Nigeria");
        map.put("纽埃", "Niue");
        map.put("诺福克岛", "Norfolk Island");
        map.put("挪威", "Norway");
        map.put("阿曼", "Oman");
        map.put("巴基斯坦", "Pakistan");
        map.put("帕劳", "Palau");
        map.put("巴勒斯坦", "Palestine");
        map.put("巴拿马", "Panama");
        map.put("巴布亚新几内亚", "Papua New Guinea");
        map.put("秘鲁", "Peru");
        map.put("菲律宾", "Philippines");
        map.put("皮特凯恩岛", "Pitcairn Islands");
        map.put("波兰", "Poland");
        map.put("葡萄牙", "Portugal");
        map.put("波多黎各", "Puerto Rico");
        map.put("卡塔尔", "Qatar");
        map.put("留尼旺", "Reunion");
        map.put("罗马尼亚", "Romania");
        map.put("卢旺达", "Rwanda");
        map.put("俄罗斯", "Russian Federation");
        map.put("圣赫勒拿", "Saint Helena");
        map.put("圣基茨和尼维斯", "Saint Kitts-Nevis");
        map.put("圣卢西亚", "Saint Lucia");
        map.put("圣文森特和格林纳丁斯", "Saint Vincent and the Grenadines");
        map.put("萨尔瓦多", "El Salvador");
        map.put("萨摩亚", "Samoa");
        map.put("圣马力诺", "San Marino");
        map.put("圣多美及普林西比", "Sao Tome and Principe");
        map.put("沙特阿拉伯", "Saudi Arabia");
        map.put("塞内加尔", "Senegal");
        map.put("塞舌尔", "Seychelles");
        map.put("塞拉利昂", "Sierra Leone");
        map.put("新加坡", "Singapore");
        map.put("塞尔维亚", "Serbia");
        map.put("斯洛伐克", "Slovakia");
        map.put("斯洛文尼亚", "Slovenia");
        map.put("所罗门群岛", "Solomon Islands");
        map.put("索马里", "Somalia");
        map.put("南非", "South Africa");
        map.put("西班牙", "Spain");
        map.put("斯里兰卡", "Sri Lanka");
        map.put("苏丹", "Sudan");
        map.put("南苏丹", "Suriname");
        map.put("斯威士兰", "Swaziland");
        map.put("瑞典", "Sweden");
        map.put("瑞士", "Switzerland");
        map.put("叙利亚", "Syria");
        map.put("塔吉克斯坦", "Tajikistan");
        map.put("坦桑尼亚", "Tanzania");
        map.put("泰国", "Thailand");
        map.put("特立尼达和多巴哥", "Trinidad and Tobago");
        map.put("东帝汶", "Timor-Leste");
        map.put("多哥", "Togo");
        map.put("托克劳", "Tokelau");
        map.put("汤加", "Tonga");
        map.put("突尼斯", "Tunisia");
        map.put("土耳其", "Turkey");
        map.put("土库曼斯坦", "Turkmenistan");
        map.put("图瓦卢", "Tuvalu");
        map.put("乌干达", "Uganda");
        map.put("乌克兰", "Ukraine");
        map.put("阿拉伯联合酋长国", "United Arab Emirates");
        map.put("英国", "United Kingdom");
        map.put("美国", "United States");
        map.put("乌拉圭", "Uruguay");
        map.put("乌兹别克斯坦", "Uzbekistan");
        map.put("瓦努阿图共和国", "Vanuatu");
        map.put("梵蒂冈", "Vatican City");
        map.put("委内瑞拉", "Venezuela");
        map.put("越南", "Vietnam");
        map.put("瓦利斯和富图纳群岛", "Wallis and Futuna");
        map.put("西撒哈拉", "Western Sahara");
        map.put("也门", "Yemen");
        map.put("南斯拉夫", "Yugoslavia");
        map.put("赞比亚", "Zambia");
        map.put("津巴布韦", "Zimbabwe");

    }

    public static String getCountryEnName(String zhName) {
        if (map.containsKey(zhName)) {
            return map.get(zhName);
        } else {
            System.out.println("cann't find the english name for : " + zhName);
            for (String key : map.keySet()) {
                if (key.indexOf(zhName) > -1) {
                    return map.get(key);
                }
            }
            return zhName;
        }
    }

    public static void main(String[] args) {
        System.out.println(CountryNameUtil.getCountryEnName("中国"));
        System.out.println(CountryNameUtil.getCountryEnName("阿拉伯"));
    }

}
