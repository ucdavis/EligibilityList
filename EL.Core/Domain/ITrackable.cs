using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.EL.Core.Domain
{
    public interface ITrackable
    {
        bool isTracked();

        bool arePropertiesTracked();
    }
}
