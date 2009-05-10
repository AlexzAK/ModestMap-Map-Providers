package com.modestmaps.mapproviders.google
{
    import com.modestmaps.core.Coordinate;
    import com.modestmaps.mapproviders.IMapProvider;
    import com.modestmaps.util.BinaryUtil;

    import flash.system.ApplicationDomain;

    /**
     * @author darren
     * @author Alexander Kabakov
     * $Id$
     */
    public class GoogleAerialMapProvider
        extends AbstractGoogleMapProvider
        implements IMapProvider
    {
        public function GoogleAerialMapProvider(minZoom:int=MIN_ZOOM, maxZoom:int=MAX_ZOOM)
        {
            super(minZoom, maxZoom);
        }

        public function toString():String
        {
            return "GOOGLE_AERIAL";
        }

        public function getTileUrls(coord:Coordinate):Array
        {
            var UrlBase: String = "http://khm0.google.com/maptilecompress?t=2&q=80&hl=ru";
            var GetX : int = coord.column;
            var GetY : int = coord.row;
            var GetZ : int = coord.zoom;
            return [ UrlBase + "&x=" + GetX + "&y=" + GetY + "&z=" + (GetZ)];
        }
    }
}