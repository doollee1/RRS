package bt.btframework.utils;

import java.util.ArrayList;
import java.util.List;

public class BList extends ArrayList<BMap> {
	private static final long serialVersionUID = 1L;

	public BList() {
		super();
	}

	public BList(List<BMap> list) {
		super(list);
	}

	@Override
	public BMap get(int index) {
		return new BMap(super.get(index));
	}
}
