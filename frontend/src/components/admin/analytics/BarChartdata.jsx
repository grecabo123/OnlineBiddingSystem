import React, { useEffect, useState } from 'react';
import { Chart } from 'primereact/chart';
import { Card } from 'primereact/card';
import axios from 'axios';
import swal from 'sweetalert';

function BarChartdata() {

    var product_name = [];
    var product_price = [];
    var product_color = [];
    const [BarFetch, setBarData] = useState([]);

    useEffect(() => {
        BarData();
    },[]);


    const BarData = () => {
        axios.get(`/api/PriceProduct`).then(res => {
            if(res.data.status === 200) {
                setBarData(res.data.data);
            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    }

    for (let index = 0; index < BarFetch.length; index++) {
        product_name.push(BarFetch[index].product_name);
        product_price.push(BarFetch[index].product_price);
        product_color.push('#'+BarFetch[index].product_color_code)
    }



    const data = {
        
        labels: product_name,
        datasets: [
            {
                label: 'Product Current Price',
                data: product_price,
                backgroundColor: product_color,
                borderWidth: 1
            }
        ]
    };
    const options = {
        indexAxis: 'y',
        maintainAspectRatio: false,
        aspectRatio: 0.8,
        scales: {
            x: {
                grid: {
                    display: false
                }
            },
            y: {
                beginAtZero: true,
                grid: {
                    display: false
                }
            }
        }
    };

    return (
        <div className=''>
            <Chart type="bar" style={{ height: "320px" }} width='100%'   data={data} options={options} />
        </div>
        
    )
}

export default BarChartdata