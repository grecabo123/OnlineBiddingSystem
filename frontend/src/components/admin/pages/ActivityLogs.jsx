import axios from 'axios';
import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';
import { Card } from 'primereact/card';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import moment from 'moment';

function ActivityLogs() {

    const [Logs, setLogs] = useState([]);
    const [loading, setLoading] = useState(true);
    useEffect(() => {
        const id = localStorage.getItem('auth_id');

        axios.get(`/api/Logs/${id}`).then(res => {
            if (res.data.status === 200) {
                setLogs(res.data.data);
            }
            setLoading(false)
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, []);
    
    const dateformat = (Logs) =>{
        return (
            <>
                {
                    moment(Logs.created_at).format("MMM DD YYYY h:m a")
                }
            </>
        )
    }


    return (
        <div className='container-fluid'>
            <Card title="Activity Logs">
                <DataTable value={Logs} loading={loading} paginator rows={10} paginatorLeft>
                    <Column field='activity' header="Activity"></Column>
                    <Column field='created_at' body={dateformat} header="DateTime"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default ActivityLogs