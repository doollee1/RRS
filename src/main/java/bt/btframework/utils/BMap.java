package bt.btframework.utils;

import java.util.HashMap;
import java.util.Map;

public class BMap extends HashMap<String, Object> {
	private static final long serialVersionUID = 1L;

	public BMap() {
		super();
	}

	public BMap(Map<? extends String, ? extends Object> m) {
		super(m);
	}

	public String getString(String key) {
		return String.valueOf(super.get(key));
	}

	public int getInt(String key) {
		return (int) super.get(key);
	}

	public boolean getBoolean(String key) {
		return (boolean) super.get(key);
	}

	public short getShort(String key) {
		return (short) super.get(key);
	}

	public byte getByte(String key) {
		return (byte) super.get(key);
	}

	public long getLong(String key) {
		return (long) super.get(key);
	}

	public float getFloat(String key) {
		return Float.parseFloat(String.valueOf(super.get(key)));
	}

	public double getDouble(String key) {
		return Double.parseDouble(String.valueOf(super.get(key)));
	}
}
