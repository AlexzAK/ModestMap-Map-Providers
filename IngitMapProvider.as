/**
 * MapProvider for ingit Map data. (http://ingit.ru/)
 *
 * @author Alexander Kabkov
 *
 */
package com.modestmaps.mapproviders
{
    import com.modestmaps.core.Coordinate;

    public class IngitMapProvider
        extends AbstractMapProvider
        implements IMapProvider
    {
        public function IngitMapProvider(minZoom:int=MIN_ZOOM, maxZoom:int=MAX_ZOOM)
        {
            super(minZoom, maxZoom);
        }

        public function toString() : String
        {
            return "INGIT_MAP";
        }

        public function getTileUrls(coord:Coordinate):Array
        {
            var GetX : int = coord.column;
            var GetY : int = coord.row;
            var GetZ : int = coord.zoom;        	
        	
            var scale:Number = (1/(((Math.pow(2,GetZ)*256)/(2*Math.PI))/(6366752*Math.cos(0*(Math.PI/180) ))))*3600;
            var ld2:int = Math.round((Math.pow(2,GetZ)*256)/2);
            var cx: String = String(ld2-(GetX*256));
            var cy: String = String(ld2-(GetY*256));

            return [
            "http://www.ingit.ru/mp/bin/GWCgi.exe?cmd=img&map=world_x.chart&w=256&h=256&dpm=3600&long=0&lat=0&conv=mrc"+
            "&scale=" + Math.round(scale).toString() + 
            "&xc=" + cx +
            "&yc=" + cy + "&cache"
            ];
        }

    }
}