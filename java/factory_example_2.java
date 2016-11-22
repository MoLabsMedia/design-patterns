// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/factory_method/java/1
// --------------

public interface ImageReader {
  public DecodedImage getDecodedImage();
}
public class GifReader implements ImageReader {
  public GifReader( InputStream in ) {}
  public DecodedImage getDecodedImage() {
    return decodedImage;
  }
}
public class JpegReader implements ImageReader {}
