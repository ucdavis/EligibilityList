using System;
using System.Collections.Generic;
using System.Text;

namespace EL.Core.Domain
{
    public interface ITrackable
    {
        bool isTracked();

        bool arePropertiesTracked();
    }
}
