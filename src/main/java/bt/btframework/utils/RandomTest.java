package bt.btframework.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class RandomTest {
 
    
    private static List removeDuplicatesAndShuffleElements(List items) {
    	Set set = new LinkedHashSet();
    	Collections.shuffle(items);//shuffle
    	set.addAll(items); //remove duplicates
    	return new ArrayList(set);
    }

	private static List getResult(List list,int times) {
		List resultList = removeDuplicatesAndShuffleElements(list);
		return resultList.subList(0,times);
	}

	public static void main(String args[]) {
		List list = new ArrayList();
		list.add(new Integer(3));
		list.add(new Integer(6));
		list.add(new Integer(8));
		list.add(new Integer(14));
		list.add(new Integer(16));
		list.add(new Integer(20));
		list.add(new Integer(27));
		list.add(new Integer(28));
		list.add(new Integer(33));
		list.add(new Integer(35));
		list.add(new Integer(42));
		list.add(new Integer(43));
		list.add(new Integer(45));
		list = getResult(list,6);
		System.out.println(list);
	}

}
