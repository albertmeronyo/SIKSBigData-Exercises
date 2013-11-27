package myudfs;

import java.io.IOException;

import org.apache.pig.FilterFunc;
import org.apache.pig.PigException;
import org.apache.pig.backend.executionengine.ExecException;
import org.apache.pig.data.DataBag;
import org.apache.pig.data.Tuple;
import org.apache.pig.data.DataType;

/**
 * Determine whether the input string contains "Bin Laden" case insensitive.
 */
public class ContainsBinLaden extends FilterFunc {

    @Override
    public Boolean exec(Tuple input) throws IOException {
      try{
	Object o = input.get(0);
	if (o instanceof String) {
		String str = (String)o;
		return str.toLowerCase().contains(new String("Bin Laden").toLowerCase());
	}
	return false;
      }catch(Exception e){
	throw new IOException("Caught exception processing input row ", e);
      }
    }
}
