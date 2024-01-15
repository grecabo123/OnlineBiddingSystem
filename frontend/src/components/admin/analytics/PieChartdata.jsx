import React, { useEffect, useState } from 'react';
import { Chart } from 'primereact/chart';
import { Card } from 'primereact/card';
import axios from 'axios';
import swal from 'sweetalert';

function PieChartdata() {

    var product_name = [];
    var product_price = [];
    var product_color = [];
    const [BarFetch, setBarData] = useState([]);

    useEffect(() => {
        BarData();
    },[]);


    const BarData = () => {
        axios.get(`/api/MostSells`).then(res => {
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
        product_name.push(BarFetch[index].name);
        product_price.push(BarFetch[index].total);
    }



    const data = {
        
        labels: product_name,
        datasets: [
            {
                label: 'Most Sells Product',
                data: product_price,
                backgroundColor: ['#42A5F5'],
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

export default PieChartdata