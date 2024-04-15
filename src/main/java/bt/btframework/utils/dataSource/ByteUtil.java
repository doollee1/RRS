/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bt.btframework.utils.dataSource;

import java.io.UnsupportedEncodingException;

/**
 *
 * @author zetman
 */
public class ByteUtil
{

    /**
     *
     */
    public static String ISO8859 = "8859_1";
    /**
     *
     */
    public static String defaultEncoding = "KSC5601";


    /**
     * 주어진 String을 byte[]로 변환한후 주어진 byte 수 만큼 자른 결과를 String으로 다시 변환하여 return.
     * @param src
     * @param byteLen
     * @return
     */

    public static String toByteSubString(String src, int byteLen)
    {
        if(src == null || src.trim().equals("")) return src;
        if(byteLen < 1) return src;

        byte[] orgByteArray = null;
        byte[] subedByteArray = null;

        orgByteArray = src.getBytes();

        // 주어진 length가 원본의 length보다 클경우
        // 원본의 length를 기준으로 설정한다.
        if(orgByteArray.length < byteLen) byteLen = orgByteArray.length;

        subedByteArray = new byte[byteLen];

        for(int i=0; i<byteLen; i++)
        {
            subedByteArray[i] = orgByteArray[i];
        }

        String strResult = null;
        strResult = new String(subedByteArray);

        return strResult;
    }

    /**
     * byte 배열을 short 로 바꾼다.
     * Creation date: (2000-09-29 오후 3:19:03)
     * @return short
     * @param byteArray byte[]
     * @param nIdx
     */
    public static short ByteToShort(byte[] byteArray, int nIdx)
    {
        short i1 = 0;
        short i2 = 0;

        i1 = (short) (byteArray[nIdx + 0] & 0x00ff);
        i2 = (short) (byteArray[nIdx + 1] & 0x00ff);
        i1 = (short) (i1 << 8);
        i1 = (short) (i1 | i2);

        return i1;
    }

    /**
     * short 값을 byte배열로 바꾼다.
     * Creation date: (2000-09-29 오후 3:19:03)
     * @return short
     * @param value
     */
    public static byte[] ShortToByte(short value)
    {
        byte[] byteArray = new byte[2];

        short i1 = 0;
        short i2 = 0;

        i1 = (short) (value & 0xFF00);
        i2 = (short) (value & 0x00FF);
        i1 = (short) (i1 >> 8);

        byteArray[0] = (byte) i1;
        byteArray[1] = (byte) i2;

        return byteArray;

    }

    /**
     *
     * @param n
     * @return
     */
    public static short HIWORD(int n)
    {
        return ((short) (((int) (n) >> 16) & 0xFFFF));
    }

    /**
     *
     * @param n
     * @return
     */
    public static short LOWORD(int n)
    {
        return ((short) n);
    }

    /**
     * short 값에서 hi byte를 return.
     * Creation date: (2000-09-29 오후 3:19:03)
     * @return byte
     * @param n
     */
    public static int BYTE_4th(int n)
    {
        return (int) (((int) (n) >> 24) & 0x000000FF);
    }

    /**
     *
     * @param n
     * @return
     */
    public static int BYTE_3th2th(int n)
    {
        return (int) (((int) (n) >> 8) & 0x0000FFFF);
    }

    /**
     * short 값에서 lo byte를 return.
     * Creation date: (2000-09-29 오후 3:19:03)
     * @return byte
     * @param s
     */
    public static byte BYTE_1th(short s)
    {
        return (byte) s;
    }

    /**
     * byte 순서 바꾸기
     * @param bytearr
     * @param st
     * @param size
     */
    public static void ByteOrderRev(byte bytearr[], int st, int size)
    {
        byte b[] = bytearr;
        byte bb[] = new byte[1];
        int i1 = st;
        int i2 = st + size - 1;
        for (int i = 0; i < size / 2; i++)
        {
            bb[0] = b[i2 - i];
            b[i2 - i] = b[i1 + i];
            b[i1 + i] = bb[0];
        }
    }

    /**
     *  int vallue 의 byte 순서바구기
     * @param lData
     * @return
     */
    public static int ByteOrderRevInt(int lData)
    {
        int l = lData;
        int l1 = l & 0xFF000000;
        int l2 = l & 0x00FF0000;
        int l3 = l & 0x0000FF00;
        int l4 = l & 0x000000FF;
        l1 = l1 >> 24;
        l2 = l2 >> 8;
        l3 = l3 << 8;
        l4 = l4 << 24;

        return l1 | l2 | l3 | l4;
    }

    /**
     * short value 의 byte 순서 바꾸기
     * @param iData
     * @return
     */
    public static short ByteOrderRevShort(short iData)
    {
        short i = iData;
        short i1 = (short) (i & 0xFF00);
        short i2 = (short) (i & 0x00FF);

        i1 = (short) (i1 >> 8);
        i2 = (short) (i2 << 8);

        return (short) (i1 | i2);
    }

    /**
     * float Decimal value 를 byte array 로 바꾸기
     * @param bytearr
     * @param st
     * @param fData
     */
    public static void FloatToByte(byte bytearr[], int st, float fData)
    {
        int l = Float.floatToIntBits(fData);

        byte b[] = bytearr;
        int idx = st;
        b[idx + 0] = (byte) ((l >> 24) & 0xff);
        b[idx + 1] = (byte) ((l >> 16) & 0xff);
        b[idx + 2] = (byte) ((l >> 8) & 0xff);
        b[idx + 3] = (byte) (l & 0xff);
    }

    /**
     * float Decimal value 를 byte array 로 바꾸기
     * @param fData
     * @return
     */
    public static byte[] FloatToByte(float fData)
    {
        int l = Float.floatToIntBits(fData);

        byte b[] = new byte[4];
        int idx = 0;
        b[idx + 0] = (byte) ((l >> 24) & 0xff);
        b[idx + 1] = (byte) ((l >> 16) & 0xff);
        b[idx + 2] = (byte) ((l >> 8) & 0xff);
        b[idx + 3] = (byte) (l & 0xff);

        return b;
    }


    /**
     * double Decimal value 를 byte array 로 바꾸기
     * @param bytearr
     * @param st
     * @param dData
     */
    public static void DoubleToByte(byte bytearr[], int st, double dData)
    {
        long l = Double.doubleToLongBits(dData);

        byte b[] = bytearr;
        int idx = st;
        b[idx + 0] = (byte) ((l >> 56) & 0xff);
        b[idx + 1] = (byte) ((l >> 48) & 0xff);
        b[idx + 2] = (byte) ((l >> 40) & 0xff);
        b[idx + 3] = (byte) ((l >> 32) & 0xff);
        b[idx + 4] = (byte) ((l >> 24) & 0xff);
        b[idx + 5] = (byte) ((l >> 16) & 0xff);
        b[idx + 6] = (byte) ((l >> 8) & 0xff);
        b[idx + 7] = (byte) (l & 0xff);
    }

    /**
     * long value 를 byte array 로 바꾸기 (실제는 int처리다.) Long으로 할려면 8byte 처리해야함. 나중에 수정
     * @param bytearr
     * @param st
     * @param lData
     */
    public static void IntToByte(byte bytearr[], int st, long lData)
    {
        byte b[] = bytearr;
        int idx = st;
        long l = lData;
        long l1 = l & 0xFF000000;
        long l2 = l & 0x00FF0000;
        long l3 = l & 0x0000FF00;
        long l4 = l & 0x000000FF;
        l1 = l1 >> 24;
        l2 = l2 >> 16;
        l3 = l3 >> 8;

        int b1 = (byte) l1;
        int b2 = (byte) l2;
        int b3 = (byte) l3;
        int b4 = (byte) l4;
        b[idx + 0] = (byte) b1;
        b[idx + 1] = (byte) b2;
        b[idx + 2] = (byte) b3;
        b[idx + 3] = (byte) b4;
    }

    /**
     * int value 를 byte array 로 바꾸기
     * @param iData
     * @return
     */
    public static byte[] IntToByte(int iData)
    {
        byte b[] = new byte[4];

        int idx = 0;
        int l = iData;

        int l1 = l & 0xFF000000;
        int l2 = l & 0x00FF0000;
        int l3 = l & 0x0000FF00;
        int l4 = l & 0x000000FF;

        l1 = l1 >> 24;
        l2 = l2 >> 16;
        l3 = l3 >> 8;

        int b1 = (byte) l1;
        int b2 = (byte) l2;
        int b3 = (byte) l3;
        int b4 = (byte) l4;

        b[idx + 0] = (byte) b1;
        b[idx + 1] = (byte) b2;
        b[idx + 2] = (byte) b3;
        b[idx + 3] = (byte) b4;

        return b;
    }

    /**
     * byte ¹?¿­?? int ·? ¹?²?´?.
     * Creation date: (2000-09-29 ¿??? 3:19:03)
     * @return int
     * @param byteArray byte[]
     */
    public static int byteToInt(byte[] byteArray)
    {
        int i1 = 0;
        int i2 = 0;

        i1 = byteArray[0] & 0x00ff;
        i2 = byteArray[1] & 0x00ff;
        i1 = i1 << 8;
        i1 = i1 | i2;

        return i1;
    }


    /**
     * byte array 를 int value 로 바꾸기
     * @param bytearr
     * @param st
     * @return
     */
    public static int ByteToInt(byte bytearr[], int st)
    {
        byte b[] = bytearr;
        int idx = st;
        int l1 = b[idx + 0] & 0x000000ff;
        int l2 = b[idx + 1] & 0x000000ff;
        int l3 = b[idx + 2] & 0x000000ff;
        int l4 = b[idx + 3] & 0x000000ff;

        l1 = l1 << 24;
        l2 = l2 << 16;
        l3 = l3 << 8;
        l1 = l1 | l2 | l3 | l4;

        return l1;
    }

    /**
     * byte 배열을 short 로 바꾼다.
     * Common에서 가져옴 2008.05.29 by jmkim
     * Creation date: (2000-09-29 오후 3:19:03)
     * @return short
     * @param byteArray byte[]
     */
    public static short byteToshort(byte[] byteArray)
    {
        int i1 = 0;
        int i2 = 0;

        i1 = byteArray[0] & 0x00ff;
        i2 = byteArray[1] & 0x00ff;
        i1 = i1 << 8;
        i1 = i1 | i2;

        return (short)i1;
    }


    /**
     * byte array 를 int value 로 바꾸기
     * @param bytearr
     * @param st
     * @return
     */
    /*
    public static long ByteToLong(byte bytearr[], int st)
    {
        byte b[] = bytearr;
        int idx = st;
        long l1 = b[idx + 0] & 0x000000ff;
        long l2 = b[idx + 1] & 0x000000ff;
        long l3 = b[idx + 2] & 0x000000ff;
        long l4 = b[idx + 3] & 0x000000ff;
        l1 = l1 << 24;
        l2 = l2 << 16;
        l3 = l3 << 8;
        l1 = l1 | l2 | l3 | l4;
        return l1;
    }


    public static int ByteToLong2(byte bytearr[], int st)
    {
        byte b[] = bytearr;
        int idx = st;
        int l1 = b[idx + 0] & 0x000000ff;
        int l2 = b[idx + 1] & 0x000000ff;
        int l3 = b[idx + 2] & 0x000000ff;
        int l4 = b[idx + 3] & 0x000000ff;
        l1 = l1 << 24;
        l2 = l2 << 16;
        l3 = l3 << 8;
        l1 = l1 | l2 | l3 | l4;
        return l1;
    }
    */
//	 byte array 를 signed logn long value 로 바꾸기
    public static long ByteToLongSigned(byte bytearr[], int st)
    {
        byte b[] = bytearr;
        int idx = st;
        //long l1 = b[idx + 0] & 0x0000007f;
        long l1 = b[idx + 0] & 0x000000ff;
        if ((l1 & 0x70000000) == 0x70000000)
        {
            l1 = ~l1 + 0x00000001;
        }

        long l2 = b[idx + 1] & 0x000000ff;
        long l3 = b[idx + 2] & 0x000000ff;
        long l4 = b[idx + 3] & 0x000000ff;
        long l5 = b[idx + 4] & 0x000000ff;
        long l6 = b[idx + 5] & 0x000000ff;
        long l7 = b[idx + 6] & 0x000000ff;
        long l8 = b[idx + 7] & 0x000000ff;

        l1 = l1 << 56;
        l2 = l2 << 48;
        l3 = l3 << 40;
        l4 = l4 << 32;
        l5 = l5 << 24;
        l6 = l6 << 16;
        l7 = l7 << 8;

        l1 = l1 | l2 | l3 | l4 | l5 | l6 | l7 | l8;
        return l1;
    }

//	 byte array 를 long long value 로 바꾸기
    /**
     *
     * @param bytearr
     * @param st
     * @return
     */
    public static long ByteToLong(byte bytearr[], int st)
    {
        /*
        //8byte로 만들어서 long값으로 변환
        byte[] tmp = new byte[ObjectProfiler.LONG_FIELD_SIZE];
        if((bytearr.length - st) < ObjectProfiler.LONG_FIELD_SIZE)
        {
            System.arraycopy(bytearr,st, tmp,0,(bytearr.length - st));
            for(int i=bytearr.length ; i<ObjectProfiler.LONG_FIELD_SIZE;i++)
            {
                tmp[i] = 0x00;
            }
            bytearr = tmp;
        }
        */
        byte b[] = bytearr;

        int idx = st;
        long l1 = b[idx + 0] & 0x000000ff;
        long l2 = b[idx + 1] & 0x000000ff;
        long l3 = b[idx + 2] & 0x000000ff;
        long l4 = b[idx + 3] & 0x000000ff;

        long l5 = b[idx + 4] & 0x000000ff;
        long l6 = b[idx + 5] & 0x000000ff;
        long l7 = b[idx + 6] & 0x000000ff;
        long l8 = b[idx + 7] & 0x000000ff;

        l1 = l1 << 56;
        l2 = l2 << 48;
        l3 = l3 << 40;
        l4 = l4 << 32;
        l5 = l5 << 24;
        l6 = l6 << 16;
        l7 = l7 << 8;

        l1 = l1 | l2 | l3 | l4 | l5 | l6 | l7 | l8;
        return l1;
    }

    /**
     * byte 를 hexa striung 으로 바꾸기
     * @param bt
     * @return
     */
    public static String ByteToHex(byte bt)
    {
        int i1 = bt & 0x00ff;
        return Integer.toHexString(i1);
    }

    /**
     * byte 값을 hex 값으로 변환한다.
     *
     * @param raw
     * @return char[]
     */
    public static char[] ByteToHex2(byte raw) {
        char[] kDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        char[] hex = new char[2];
        int value = (raw + 256) % 256;
        int highIndex = value >> 4;
        int lowIndex = value & 0x0f;
        hex[0] = kDigits[highIndex];
        hex[1] = kDigits[lowIndex];
        return hex;
    }

    /**
     * byte 를 hexa string 으로 바꾸기
     * TrxRunner....에서 byte값을 hex로 보여주기 위함
     * @param bt
     * @return
     */
    public static String ByteToHex3(byte bt)
    {
        int v = bt & 0x00ff;
        StringBuffer buf = new StringBuffer();

        for (int i = 0; i < 2; i++)
        {
            // Get lowest bit
            int remainder = v & 0xf;

            // Convert bit to a character and insert it into the beginning of the string
            switch (remainder)
            {
                case 0:
                    buf.insert(0, "0");
                    break;
                case 1:
                    buf.insert(0, "1");
                    break;
                case 2:
                    buf.insert(0, "2");
                    break;
                case 3:
                    buf.insert(0, "3");
                    break;
                case 4:
                    buf.insert(0, "4");
                    break;
                case 5:
                    buf.insert(0, "5");
                    break;
                case 6:
                    buf.insert(0, "6");
                    break;
                case 7:
                    buf.insert(0, "7");
                    break;
                case 8:
                    buf.insert(0, "8");
                    break;
                case 9:
                    buf.insert(0, "9");
                    break;
                case 10:
                    buf.insert(0, "A");
                    break;
                case 11:
                    buf.insert(0, "B");
                    break;
                case 12:
                    buf.insert(0, "C");
                    break;
                case 13:
                    buf.insert(0, "D");
                    break;
                case 14:
                    buf.insert(0, "E");
                    break;
                case 15:
                    buf.insert(0, "F");
                    break;
            }

            // Shift the int to the right one bit
            v >>>= 4;
        }

        return buf.toString();
    }

    /**
     * byte array 를 signed logn value 로 바꾸기
     * 이거 제대로 처리 못한다 sign값
     * @param bytearr
     * @param st
     * @return
     */
    public static long ByteToSLong(byte bytearr[], int st)
    {
        byte b[] = bytearr;
        int idx = st;
        long l1 = b[idx + 0] & 0x0000007f;
        long l2 = b[idx + 1] & 0x000000ff;
        long l3 = b[idx + 2] & 0x000000ff;
        long l4 = b[idx + 3] & 0x000000ff;
        l1 = l1 << 24;
        l2 = l2 << 16;
        l3 = l3 << 8;
        l1 = l1 | l2 | l3 | l4;
        return l1;
    }

    /**
     * byte array 를 float value 로 바꾸기
     * @param bytearr
     * @param st
     * @return
     */
    public static float ByteToFloat(byte bytearr[], int st)
    {
        byte b[] = bytearr;
        int idx = st;
        int l1 = (((int) b[idx + 0]) & 0xff) << 24 |
                (((int) b[idx + 1]) & 0xff) << 16 |
                (((int) b[idx + 2]) & 0xff) << 8 |
                (((int) b[idx + 3]) & 0xff);
        String temp = Float.toString(Float.intBitsToFloat(l1));
        return Float.parseFloat(temp);
    }

    /**
     * byte array 를 double decimal value 로 바꾸기
     * @param bytearr
     * @param st
     * @return
     */
    /*
    public static double ByteToDouble(byte bytearr[], int st)
    {
        byte b[] = bytearr;
        int idx = st;
        long l1 =  (((long) (b[idx + 0] & 0xff))) << 56 |
                    (((long) (b[idx + 1] & 0xff))) << 48 |
                    (((long) (b[idx + 2] & 0xff))) << 40 |
                    (((long) (b[idx + 3] & 0xff))) << 32 |
                    (((long) (b[idx + 4] & 0xff))) << 24 |
                    (((long) (b[idx + 5] & 0xff))) << 16 |
                    (((long) (b[idx + 6] & 0xff))) <<  8 |
                    ((long) (b[idx + 7] & 0xff));

        //String temp = Double.toString(Double.longBitsToDouble(l1));
        //return Double.parseDouble(temp);

        return Double.longBitsToDouble(l1);
    }
    */

    /**
     * byte array 의 일부를  지정한 길이만큼  잘라서 copy 하기
     * @param src
     * @param dst
     * @param st
     * @param dt
     * @param len
     */
    public static void bytecopy(byte src[], int st, byte dst[], int dt, int len)
    {
        //DibPacket에서 char 데이터의 형태는 이렇다. 실제 dib 조회에서
        //layout size가 89000+header_size 사이즈로 잡혀있다고 해서 무조건 rp 데이터를 89000+header_size
        //사이즈만큼 무조건 주는것은 아니다. 즉 시황같은경우 네트윅상의 데이터를 줄이기위해 실제 내용이 500 바이트
        //이다면 500 + header_size만큼만 내려준다.
        //즉 bytearray src크기가 500인데 600번째의 bytearray값을 빼내려한다 .잘못된것이죠 ㅎㅎㅎ
        //그래서 동문 수정. --- 2003/11/03 으하하

        int i = 0;
        if (src.length - st >= len) /*Rp가 실 layout길이만큼 다 채워져 온다*/
        {
            for (i = 0; i < len; i++)
            {
                dst[dt + i] = src[st + i];
            }
        }
        else	/* 실데이터만 보낸다 */
        {
            //ArrayIndexOutOfBoundsException
            if (src.length - st == 0)
            {
                throw new ArrayIndexOutOfBoundsException();
            }

            for (i = 0; i < src.length - st; i++)
            {
                dst[dt + i] = src[st + i];
            }
        }
    }

    /**
     * string array 를 string 으로 바꾸기
     * @param b
     * @param st
     * @param size
     * @return
     */
    public static String ByteToString(byte b[], int st, int size)
    {
        StringBuffer sbuf = new StringBuffer();
        for (int i = 0; i < size; i++)
        {
            sbuf.append((char) b[st + i]);
        }
        return sbuf.toString();
    }

    /**
     * 순수 bytearray 를 add 하기 위한 메소드추가
     * @param src
     * @param offset
     * @param byteValue
     * @param length
     * @return
     */
    public static byte[] appendBytes(byte[] src, int offset, byte[] byteValue, int length)
    {
        int packet_len = offset + length;
        byte[] packet = new byte[packet_len];

        for (int i = 0; i < offset; i++)
        {
            packet[i] = src[i];
        }

        int k = 0;
        for (int j = offset; j < packet_len; j++, k++)
        {
            packet[j] = byteValue[k];
        }

        return packet;
    }

    /*
     * 1byte를 추가하기 위한 함수.
     */
    /**
     *
     * @param src
     * @param offset
     * @param byteValue
     * @param length
     * @return
     */
    public static byte[] appendBytes(byte[] src, int offset, byte byteValue, int length)
    {
        int packet_len = offset + length;
        byte[] packet = new byte[packet_len];

        for (int i = 0; i < offset; i++)
        {
            packet[i] = src[i];
        }

        packet[offset] = (byte) byteValue;

        return packet;
    }



    /**
     * Add from External
     * @param orgStr
     * @param rightAlign
     * @param padChar
     * @return
     */
    public static byte[] toFixedBytes(String orgStr, int lenBuffer, char padChar, boolean rightAlign,boolean bAttribute)
    {
        if (orgStr == null)
        {
            orgStr = "";
        }

        byte[] orgByte = orgStr.getBytes();

        int orgLen = orgByte.length;

        if (orgLen == lenBuffer)
        {
            return orgByte;
        }

        if (orgLen < lenBuffer) // 주어진 길이보다 모자란다면, Padding character로 채운다.
        {
            byte[] newByte = new byte[lenBuffer];

            // 기존과 동일 전체 buffer를 그대로 사용하여 padding한다.
            if (rightAlign && (bAttribute == false))
            {

                int padLen = lenBuffer - orgLen;

                for (int i = 0; i < padLen; i++)
                {
                    newByte[i] = (byte) padChar;
                }

                System.arraycopy(orgByte, 0, newByte, padLen, orgLen);
            }
            //오른쪽 align이면서 attribute 이면 오른쪽 마지막 바이트는 사용하지 않는다. 속성바이트로 사용되기 때문에..
            else if((rightAlign && (bAttribute == true)))
            {
                int padLen = (lenBuffer - 1) - orgLen;

                for (int i = 0; i < padLen; i++)
                {
                    newByte[i] = (byte) padChar;
                }

                System.arraycopy(orgByte, 0, newByte, padLen, orgLen);
            }
            else  // left alignment
            {
                System.arraycopy(orgByte, 0, newByte, 0, orgLen);
                while (orgLen < lenBuffer)
                {
                    newByte[orgLen++] = (byte) padChar;
                }
            }

            return newByte;
        }
        else // ( orgLen > len) // 주어진 길이보다 남는다면, 주어진 길이만큼만 잘른다.
        {
            byte[] newByte = new byte[lenBuffer];
            System.arraycopy(orgByte, 0, newByte, 0, lenBuffer);
            return newByte;
        }
    }

    /*
     * @desc:원하는 바이트 만큼 2진수로 값을 뿌려주는 함수
     * @param:nValue - 2진수로 변환을 원하는 값
     * @param BitLen - 출력할 Byte 수
     * @return BitLen 길이로 nValue를 2진수로 출력함
     */
    /**
     *
     * @param lValue
     * @param nLength
     * @param BitLen
     * @return
     */
    public static String toBinaryString(long lValue, int nLength, int BitLen)
    {
        String dummyBit = "";

        for (int j = 0; j < (BitLen - nLength); j++)
        {
            dummyBit += "0";
        }

        String binString = "";
        binString = dummyBit + Long.toBinaryString(lValue);

        return binString;
    }

    /**
     * int value 를 byte array 로 바꾸기
     * @param bytearr
     * @param st
     * @param iData
     */
    public static void ShortToByte(byte bytearr[], int st, int iData)
    {
        byte b[] = bytearr;
        int idx = st;
        int i = iData;
        int i1 = i & 0xFF00;
        int i2 = i & 0x00FF;
        i1 = i1 >> 8;
        int b1 = (byte) i1;
        int b2 = (byte) i2;
        b[idx + 0] = (byte) b1;
        b[idx + 1] = (byte) b2;
    }

    /**
     * 순수 bytearray 를 add 하기 위한 메소드추가
     * @param src
     * @param length
     * @param offset
     * @param byteValue
     * @return
     */
    public static byte[] addSubBytes(byte[] src, int offset, byte[] byteValue, int length)
    {
        int packet_len = offset + length;
        byte[] packet = new byte[packet_len];

        for (int i = 0; i < offset; i++)
        {
            packet[i] = src[i];
        }

        int k = 0;
        for (int j = offset; j < packet_len; j++, k++)
        {
            packet[j] = byteValue[k];
        }

        return packet;
    }

    /**
     * Add from External
     * @param src
     * @param offset
     * @param paddingValue
     * @param value
     * @param alignType
     * @param length
     * @return
     */
    public static byte[] addSubBytes(byte[] src, int offset, String value, int length, char alignType, char paddingValue,boolean bAttribute)
    {
        int packet_len = offset + length;
        byte[] packet = new byte[packet_len];

        //System.out.println("111111111111111111111111111111111111111111");

        //System.out.println("The Value ==> " +  value + " offset : " + offset + " length : " + length +  "  alignType : " + alignType + " paddingValue : " +  paddingValue);

//        for (int i = 0; i < offset; i++)
//        {
//            packet[i] = src[i];
//        }

        System.arraycopy(src,0,packet, 0, offset);


        byte[] temporaryValue = null;

        byte[] byteValue = value.getBytes();

        if (byteValue.length < length)
        {

            switch (alignType)
            {
                case 'L':
                    temporaryValue = toFixedBytes(value, length, paddingValue, false,bAttribute);
                    break;
                case 'R':
                    temporaryValue = toFixedBytes(value, length, paddingValue, true,bAttribute);
                    break;
                case 'P':
                    temporaryValue = toFixedBytes(value, length, '0', true,bAttribute);
                    break;
                case 'C':
                default:
                    temporaryValue = toFixedBytes(value, length, ' ', false,bAttribute);
                    break;
            }
        }
        else
        {
            temporaryValue = byteValue;
        }

//        int k = 0;
//        for (int j = offset; j < packet_len; j++, k++)
//        {
//            packet[j] = temporaryValue[k];
//        }

        System.arraycopy(temporaryValue,0,packet, offset, temporaryValue.length);

        return packet;
    }





    //	 Add by jjungkey (2005/11/16)
//	 long value 를 byte array 로 바꾸기
    /**
     *
     * @param bytearr
     * @param st
     * @param lData
     */
    public static void LongToByte(byte bytearr[], int st, long lData)
    {
        byte b[] = bytearr;
        int idx = st;
        long l = lData;
        long l1 = l & 0xFF00000000000000L;
        long l2 = l & 0x00FF000000000000L;
        long l3 = l & 0x0000FF0000000000L;
        long l4 = l & 0x000000FF00000000L;

        long l5 = l & 0xFF000000L;
        long l6 = l & 0x00FF0000L;
        long l7 = l & 0x0000FF00L;
        long l8 = l & 0x000000FFL;

        l1 = l1 >> 56;
        l2 = l2 >> 48;
        l3 = l3 >> 40;

        l4 = l4 >> 32;
        l5 = l5 >> 24;
        l6 = l6 >> 16;
        l7 = l7 >> 8;

        int b1 = (byte) l1;
        int b2 = (byte) l2;
        int b3 = (byte) l3;
        int b4 = (byte) l4;
        int b5 = (byte) l5;
        int b6 = (byte) l6;
        int b7 = (byte) l7;
        int b8 = (byte) l8;

        b[idx + 0] = (byte) b1;
        b[idx + 1] = (byte) b2;
        b[idx + 2] = (byte) b3;
        b[idx + 3] = (byte) b4;
        b[idx + 4] = (byte) b5;
        b[idx + 5] = (byte) b6;
        b[idx + 6] = (byte) b7;
        b[idx + 7] = (byte) b8;

    }

    //	 Add by jjungkey (2005/11/16)
//	 long value 를 byte array 로 바꾸기
    /**
     *
     * @param lData
     * @return
     */
    public static byte[] LongToByte(long lData)
    {
        byte b[] = new byte[8];
        int idx = 0;
        long l = lData;
        long l1 = l & 0xFF00000000000000L;
        long l2 = l & 0x00FF000000000000L;
        long l3 = l & 0x0000FF0000000000L;
        long l4 = l & 0x000000FF00000000L;

        long l5 = l & 0xFF000000L;
        long l6 = l & 0x00FF0000L;
        long l7 = l & 0x0000FF00L;
        long l8 = l & 0x000000FFL;

        l1 = l1 >> 56;
        l2 = l2 >> 48;
        l3 = l3 >> 40;

        l4 = l4 >> 32;
        l5 = l5 >> 24;
        l6 = l6 >> 16;
        l7 = l7 >> 8;

        int b1 = (byte) l1;
        int b2 = (byte) l2;
        int b3 = (byte) l3;
        int b4 = (byte) l4;
        int b5 = (byte) l5;
        int b6 = (byte) l6;
        int b7 = (byte) l7;
        int b8 = (byte) l8;

        b[idx + 0] = (byte) b1;
        b[idx + 1] = (byte) b2;
        b[idx + 2] = (byte) b3;
        b[idx + 3] = (byte) b4;
        b[idx + 4] = (byte) b5;
        b[idx + 5] = (byte) b6;
        b[idx + 6] = (byte) b7;
        b[idx + 7] = (byte) b8;

        return b;
    }

    /**
     * <PRE>
     * 주어진 byte[] 에서 주어진 sOffset 부터 eOffset까지 subBytes 한다.
     * 단, 원본이 eOffset보다 작은경우는 원본의 Length 만큼만 자른다.
     * @param bSrc
     * @param sOffset	: sub할 시작위치
     * @param eOffset	: sub할 마지막위치
     * @return
     * </PRE>
     */
    public static byte[] subBytes(byte bSrc[], int sOffset, int eOffset)
    {
        // validation
        // bSrc의 길이가 sOffset 보다 작으면 안된다.
        if (bSrc == null || bSrc.length < 1 || bSrc.length < sOffset)
        {
            return bSrc;
        }

        // eOffset의 값이 실제 bSrc이 길이보다 작을경우에는 bSrc의 길이가 eOffset값이 된다.
        if (bSrc.length < eOffset)
        {
            eOffset = bSrc.length;
        }

        // sub된 byte[] 의 길이
        int bSubSize;
        bSubSize = eOffset - sOffset;

        // sub된 byte[]
        byte[] bSub = new byte[bSubSize];

        for (int i = 0; i < bSubSize; i++)
        {
            bSub[i] = bSrc[sOffset + i];
        }

        return bSub;

    }

    /**
     * Mod by jjungkey(2000/11/07)
     * Normal (Raw type) type 추가
     * @param src
     * @param paddingValue
     * @param offset
     * @param length
     * @param alignType
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String cutResultToString(byte[] src, int offset, int length, char alignType, char paddingValue) throws UnsupportedEncodingException
    {
        String resultString = "";

        //System.out.println("align type ==> " + alignType);
        switch (alignType)
        {
            // Left
            case 'L':
                resultString = toSubString(src, offset, length, paddingValue, 'L');
                break;
            // Right
            case 'R':
                resultString = toSubString(src, offset, length, paddingValue, 'R');
                break;
            // Normal(0)
            case 'N':
                resultString = toSubString(src, offset, length, '0', 'N');
                break;
            // Default 는 Left
            default:
                resultString = toSubString(src, offset, length, ' ', 'L');
                break;
        }

        return resultString;

    }

    /**
     * Mod by jjungkey(2000/11/07)
     * alignType중 Raw type 추가를 위해 함수의 파라미터 수정
     * Mod by dmlim(2004/09/20 잘못된문자가 온경우 new String시 이후 문자는 무시해버린다.
     * 컨츠 와 같이 은 잘못되어서 new String 시 encoding 옵션을 준다.
     * @param bytes
     * @param offset
     * @param type
     * @param length
     * @param paddingValue
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String toSubString(byte[] bytes, int offset, int length,char paddingValue, char type) throws UnsupportedEncodingException
    {
        byte[] orgSubBytes = new byte[length];

        try
        {
            bytecopy(bytes, offset, orgSubBytes, 0, length);
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
            //e.printStackTrace();

            return "";

            //return new String(orgSubBytes,"cp949");
        }

        //혹시 패딩하다가 잘못된 경우가 발생할경우 원본 데이타를 그대로 return 하게 한다.
        String rtnStr = new String(orgSubBytes,"cp949");
        //byte를 String으로 바꿀때 반드시 cp949로 인코딩해야한다. 그냥 스트링,euc-kr로 하면 특정 byte는 ""로 나올수있다.
        //KLogger.toHexlog("ByteUtil.toSubString() String Before",orgSubBytes);
        //String value1 = new String(orgSubBytes);
        //String value2 = new String(orgSubBytes,"EUC-KR");
        //String value3 = new String(orgSubBytes,"cp949");

        //KLogger.debug("[ByteUtil.toSubString()] subbyte offset = "+offset+",length = "+length+",value = "+value1+"["+value1.length()+"]");
        //KLogger.debug("[ByteUtil.toSubString()] subbyte offset = "+offset+",length = "+length+",euc-kr value = "+value2+"["+value2.length()+"]");
        //KLogger.debug("[ByteUtil.toSubString()] subbyte offset = "+offset+",length = "+length+",cp949 value = "+value3+"["+value3.getBytes().length+"]");
        //KLogger.toHexlog("ByteUtil.toSubString() String After",value3.getBytes());
        try
        {
            // 오른쪽 정렬
            if (type == 'R')
            {
                // 앞에서 부터 remVal와 다른 byte가 처음으로 나오는 위치를 찾는다.
                for (int i = 0; i < length; i++)
                {
                    if (orgSubBytes[i] != (byte) paddingValue)
                    {
                        //return new String(orgSubBytes, i, length - i, "EUC-KR");
                        return new String(orgSubBytes, i, length - i,"cp949");
                    }
                }
            }
            // raw data 를 그냥 리턴
            else if (type == 'N')
            {
                //return new String(orgSubBytes, 0, length, "EUC-KR");
                return new String(orgSubBytes, 0, length,"cp949");
            }
            // 왼쪽 정렬
            else
            {

                // 뒤에서 부터 paddingValue과 다른 byte가 처음으로 나오는 위치를 찾는다.
                for (int i = length - 1; i >= 0; i--)
                {
                    if (orgSubBytes[i] != (byte) paddingValue)
                    {
                        //return new String(orgSubBytes, 0, i + 1, "EUC-KR");

                        //KLogger.debug("[ByteUtil.toSubString()] subbyte value = "+new String(orgSubBytes, 0, i + 1));
                        return new String(orgSubBytes, 0, i + 1,"cp949");
                    }
                }
            }
        }
        //catch (UnsupportedEncodingException e)
        catch(Exception e)
        {
            e.printStackTrace();

            return rtnStr;
        }

        // 여기까지 온 것은 위에서 처리하지 못하고 원본데이타가 바로 리턴된느 경우.
        return rtnStr;
    }

    /**
     * Add by jjungkey(2001/03/26)
     * @param src
     * @param offset
     * @param length
     * @return
     */
    public static byte[] cutResult(byte[] src, int offset, int length)
    {
        byte[] orgSubBytes = new byte[length];

        bytecopy(src, offset, orgSubBytes, 0, length);
        return orgSubBytes;
    }

    /**
     *
     * @param s
     * @return
     */
    public static String toISO8859(String s)
    {
        if (s == null || s.equals(""))
        {
            return s;
        }

        try
        {
            //2005.05.27. 한글깨짐으로 encoding제거 by jmkim
            //return new String(s.getBytes(defaultEncoding), ISO8859);
            return s;
        }
        catch (Exception e)
        {
            return s;
        }
    }

    /**
     * byte array를 bit형식으로 표현하기 2008.12.29 hwseo
     * @param src
     * @return
     */
    public static String byteArrayToBinary(byte[] src)
    {
        byte[] byteArray=src;
        int bLength = byteArray.length;
        int[] bitArray=new int[8*bLength];

        StringBuffer sb=new StringBuffer();

        for (int i=0; i<bLength; i++)
        {
            for (int j=0; j<8; j++)
            {
                bitArray[(i*8)+(7-j)] = (byteArray[i] & (0x01 << j)) >> j;
            }
        }
        for (int i=0; i<bitArray.length; i++)
        {
            if ( i%8 == 0 )
            {
                //System.out.println();
                //sb.append("\n");
                //sb.append("["+i/8+"]");
            }
            sb.append((bitArray[i]));
        }

        return sb.toString();
    }

    //  little endian ==> big endian 2009.05.26
    public static int getBigEndian(byte[] byteValue)
    {
        int[] arr = new int[4];
        for(int i=0;i<4;i++)
        {
            arr[i] = (int)(byteValue[3-i] & 0xFF);
        }
        return ((arr[0]  << 24) | (arr[1]  << 16) | (arr[2]  << 8) | (arr[3]  << 0));
    }

    // int ==> byte
    public static byte[] int2Bytes(int i)
    {
        byte[] buf = new byte[4];
        buf[0] = (byte)( (i >>> 24) & 0xFF );
        buf[1] = (byte)( (i >>> 16) & 0xFF );
        buf[2] = (byte)( (i >>>  8) & 0xFF );
        buf[3] = (byte)( (i >>>  0) & 0xFF );

        return buf;
    }
}
